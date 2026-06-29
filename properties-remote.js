(function () {
  function uniquePhotos(photos) {
    return [...new Set((photos || []).filter(Boolean).map((photo) => String(photo).trim()).filter(Boolean))];
  }

  function numberOrNull(value) {
    if (value === "" || value === null || value === undefined) return null;
    const number = Number(value);
    return Number.isFinite(number) ? number : null;
  }

  function mapRow(row) {
    const photos = uniquePhotos(Array.isArray(row.photos) ? row.photos : []);
    const fallbackImage = row.fallback_image || row.image || photos[0] || "assets/property-hero.jpg";
    return {
      id: row.legacy_id || row.id,
      dbId: row.id,
      ownerId: row.owner_id,
      title: row.title,
      address: row.address,
      city: row.city,
      state: row.state,
      zip: row.zip,
      bedrooms: numberOrNull(row.bedrooms),
      bathrooms: numberOrNull(row.bathrooms),
      sqft: numberOrNull(row.sqft),
      rent: numberOrNull(row.rent),
      image: row.image || fallbackImage,
      fallbackImage,
      photos: photos.length ? photos : [fallbackImage],
      description: { en: row.description_en || "", es: row.description_es || "" },
      zillowUrl: row.zillow_url || "",
      approved: Boolean(row.approved),
      createdAt: row.created_at
    };
  }

  function toRow(property, ownerId) {
    const photos = uniquePhotos(property.photos || []);
    return {
      title: String(property.title || property.address || "Propiedad").trim(),
      address: String(property.address || "").trim(),
      city: String(property.city || "").trim(),
      state: String(property.state || "").trim().toUpperCase(),
      zip: String(property.zip || "").trim(),
      bedrooms: numberOrNull(property.bedrooms),
      bathrooms: numberOrNull(property.bathrooms),
      sqft: numberOrNull(property.sqft),
      rent: numberOrNull(property.rent),
      image: photos[0] || "assets/property-hero.jpg",
      fallback_image: photos[0] || "assets/property-hero.jpg",
      photos,
      description_en: String(property.descriptionEn || "").trim(),
      description_es: String(property.descriptionEs || "").trim(),
      zillow_url: String(property.zillowUrl || "").trim(),
      owner_id: ownerId
    };
  }

  async function fetchApprovedProperties() {
    if (!window.supabaseClient) return null;
    try {
      const { data, error } = await window.supabaseClient
        .from("properties")
        .select("*")
        .eq("approved", true)
        .order("created_at", { ascending: false });
      if (error || !Array.isArray(data)) return null;
      return data.map(mapRow);
    } catch {
      return null;
    }
  }

  async function requireSession(redirectTo) {
    if (!window.supabaseClient) return null;
    const { data } = await window.supabaseClient.auth.getSession();
    const session = data && data.session;
    if (!session && redirectTo) {
      window.location.href = redirectTo;
      return null;
    }
    return session;
  }

  async function getProfile(userId) {
    if (!window.supabaseClient || !userId) return null;
    const { data, error } = await window.supabaseClient
      .from("profiles")
      .select("*")
      .eq("id", userId)
      .single();
    if (error) return null;
    return data;
  }

  window.NJRemoteProperties = {
    uniquePhotos,
    mapRow,
    toRow,
    fetchApprovedProperties,
    requireSession,
    getProfile
  };
})();
