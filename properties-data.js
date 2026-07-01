(function () {
  const STORAGE_KEY = "nj-managed-properties-v1";

  function redfinPhotos(folder, mls, total, start = 1) {
    return Array.from({ length: total }, (_, index) => index + start).map((photoNumber) => {
      return `https://ssl.cdn-redfin.com/photo/185/bigphoto/${folder}/${mls}_${photoNumber}.jpg`;
    });
  }

  function uniquePhotos(photos) {
    return [...new Set((photos || []).filter(Boolean).map((photo) => String(photo).trim()).filter(Boolean))];
  }

  const defaultProperties = [
    {
      id: "73561400",
      title: "5903 Jessamine Ln",
      address: "5903 Jessamine Ln",
      city: "Louisville",
      state: "KY",
      zip: "40258",
      bedrooms: 3,
      bathrooms: 1,
      sqft: 2268,
      rent: 1780,
      image: "assets/properties/5903-jessamine.jpg",
      fallbackImage: "assets/properties/5903-jessamine.jpg",
      photos: uniquePhotos([
        "https://photos.zillowstatic.com/fp/855b690522816a1e1e962a1f346f2f75-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/4b21a3846a53b37f9833c802baf3a290-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/8efb555d4858c9800bec57f6a960f223-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/a3fecb54eb5cb7a99a0a347dd485da06-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/c83d1ac150dd50368bb2e4e756872511-cc_ft_960.jpg",
        "assets/properties/5903-jessamine.jpg",
        ...redfinPhotos("305", "1668305", 12, 0)
      ]),
      description: {
        en: "Classic stone ranch on a large corner lot with an updated kitchen, granite countertops, fresh paint, laminate flooring, and a finished basement for extra living space.",
        es: "Casa ranch de piedra en lote amplio con cocina renovada, granito, pintura fresca, piso laminado y sotano terminado para mas espacio."
      },
      zillowUrl: "https://www.zillow.com/homedetails/5903-Jessamine-Ln-Louisville-KY-40258/73561400_zpid/"
    },
    {
      id: "73587912",
      title: "2205 Elmhurst Ave",
      address: "2205 Elmhurst Ave",
      city: "Louisville",
      state: "KY",
      zip: "40216",
      bedrooms: 2,
      bathrooms: 1,
      sqft: 710,
      rent: 1130,
      image: "assets/properties/2205-elmhurst.jpg",
      fallbackImage: "assets/properties/2205-elmhurst.jpg",
      photos: uniquePhotos([
        "https://photos.zillowstatic.com/fp/ad26e9d9599373ecb50288ab09db4836-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/549a7ce56057a6f04592941d8fb42014-cc_ft_960.jpg",
        "assets/properties/2205-elmhurst.jpg"
      ]),
      description: {
        en: "Renovated home on a quiet street off Rockford Lane with a private back yard, convenient location, hardwood flooring, washer and dryer, deck, and porch.",
        es: "Casa renovada en una calle tranquila cerca de Rockford Lane, con patio privado, buena ubicacion, piso de madera, lavadora y secadora, deck y porche."
      },
      zillowUrl: "https://www.zillow.com/homedetails/2205-Elmhurst-Ave-Louisville-KY-40216/73587912_zpid/"
    },
    {
      id: "73577696",
      title: "7903 Canna Dr",
      address: "7903 Canna Dr",
      city: "Louisville",
      state: "KY",
      zip: "40258",
      bedrooms: 3,
      bathrooms: 1,
      sqft: 1750,
      rent: 1580,
      image: "assets/properties/7903-canna.jpg",
      fallbackImage: "assets/properties/7903-canna.jpg",
      photos: uniquePhotos([
        "https://photos.zillowstatic.com/fp/816401ad9e6f9db23ec2430bf3b41162-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/a6bfc21b386f3e1144b05eb65b19daa3-cc_ft_960.jpg",
        "assets/properties/7903-canna.jpg",
        ...redfinPhotos("543", "1680543", 10)
      ]),
      description: {
        en: "Brick ranch in PRP with fenced back yard, finished basement, attached carport, two-car detached garage, stainless steel appliances, and flexible lower-level space.",
        es: "Ranch de ladrillo en PRP con patio cercado, sotano terminado, carport, garaje separado para dos carros, electrodomesticos de acero inoxidable y espacio flexible abajo."
      },
      zillowUrl: "https://www.zillow.com/homedetails/7903-Canna-Dr-Louisville-KY-40258/73577696_zpid/"
    },
    {
      id: "73547767",
      title: "103 Scottsdale Blvd",
      address: "103 Scottsdale Blvd",
      city: "Louisville",
      state: "KY",
      zip: "40214",
      bedrooms: 3,
      bathrooms: 2,
      sqft: 1397,
      rent: 1590,
      image: "assets/properties/103-scottsdale.jpg",
      fallbackImage: "assets/properties/103-scottsdale.jpg",
      photos: uniquePhotos([
        "https://photos.zillowstatic.com/fp/5a1ca297940492b3fffdd3f8bdfbb04f-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/7efaaae0c61947daad10e6bb78a67463-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/ecd65593f332153097882aed0a882025-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/d6ead7bb860641248f3f45fd9c0ac42f-cc_ft_960.jpg",
        "https://photos.zillowstatic.com/fp/d1e11fc6afd416a44ae4c74816268f67-cc_ft_960.jpg",
        "assets/properties/103-scottsdale.jpg",
        ...redfinPhotos("043", "1712043", 10),
        ...redfinPhotos("612", "1703612", 8)
      ]),
      description: {
        en: "Warm, well-maintained ranch with open kitchen and great room, updated kitchen, pantry, laundry area, covered front porch, patio, privacy-fenced yard, pool, and storage shed.",
        es: "Ranch acogedor y bien cuidado con cocina abierta, great room, cocina renovada, pantry, laundry, porche cubierto, patio, cerca privada, piscina y shed."
      },
      zillowUrl: "https://www.zillow.com/homedetails/103-Scottsdale-Blvd-Louisville-KY-40214/73547767_zpid/"
    },
    {
      id: "73541489",
      title: "3709 Carpenter Dr",
      address: "3709 Carpenter Dr",
      city: "Louisville",
      state: "KY",
      zip: "40229",
      bedrooms: 3,
      bathrooms: 1.5,
      sqft: 1134,
      rent: 1538,
      image: "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_1.jpg",
      fallbackImage: "assets/property-hero.jpg",
      photos: uniquePhotos([...redfinPhotos("443", "1616443", 12)]),
      description: {
        en: "Bright ranch in Silver Heights with three bedrooms, one full bath plus a half bath, an attached garage, porch, chain-link fencing, and a spacious back yard.",
        es: "Ranch claro en Silver Heights con tres habitaciones, un bano completo y medio bano, garaje, porche, cerca de chain link y un patio amplio."
      },
      zillowUrl: "https://www.zillow.com/homedetails/3709-Carpenter-Dr-Louisville-KY-40229/73541489_zpid/"
    },
    {
      id: "73649367",
      title: "9507 Polaris Dr",
      address: "9507 Polaris Dr",
      city: "Louisville",
      state: "KY",
      zip: "40229",
      bedrooms: 3,
      bathrooms: 1,
      sqft: 1025,
      rent: 1522,
      image: "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_1.jpg",
      fallbackImage: "assets/property-hero.jpg",
      photos: uniquePhotos([...redfinPhotos("968", "1619968", 12)]),
      description: {
        en: "Silver Heights ranch with three bedrooms, first-floor living, dining room, kitchen, driveway parking, and major systems reported replaced in recent years.",
        es: "Ranch en Silver Heights con tres habitaciones, distribucion en un solo nivel, comedor, cocina, parqueo en driveway y sistemas principales reportados como reemplazados en anos recientes."
      },
      zillowUrl: "https://www.zillow.com/homedetails/9507-Polaris-Dr-Louisville-KY-40229/73649367_zpid/"
    }
  ];

  function numberOrNull(value) {
    if (value === "" || value === null || value === undefined) return null;
    const number = Number(value);
    return Number.isFinite(number) ? number : null;
  }

  function clone(value) {
    return JSON.parse(JSON.stringify(value));
  }

  function normalizeProperty(property, index = 0) {
    const description = typeof property.description === "string"
      ? { en: property.description, es: property.description }
      : property.description || {};
    const photos = uniquePhotos(property.photos || []);
    const fallbackImage = property.fallbackImage || property.image || photos[0] || "assets/property-hero.jpg";
    const image = property.image || photos[0] || fallbackImage;

    return {
      id: String(property.id || `manual-${Date.now()}-${index}`),
      title: String(property.title || property.address || "Nueva propiedad").trim(),
      address: String(property.address || "").trim(),
      city: String(property.city || "").trim(),
      state: String(property.state || "").trim().toUpperCase(),
      zip: String(property.zip || "").trim(),
      bedrooms: numberOrNull(property.bedrooms),
      bathrooms: numberOrNull(property.bathrooms),
      sqft: numberOrNull(property.sqft),
      rent: numberOrNull(property.rent),
      image,
      fallbackImage,
      photos: photos.length ? photos : uniquePhotos([image, fallbackImage]),
      description: {
        en: String(description.en || description.es || "").trim(),
        es: String(description.es || description.en || "").trim()
      },
      zillowUrl: String(property.zillowUrl || "").trim()
    };
  }

  function load(fallback = defaultProperties) {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      if (raw) {
        const parsed = JSON.parse(raw);
        if (Array.isArray(parsed)) return parsed.map(normalizeProperty);
      }
    } catch {
      return clone(fallback).map(normalizeProperty);
    }

    return clone(fallback).map(normalizeProperty);
  }

  function save(properties) {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify((properties || []).map(normalizeProperty)));
      return { ok: true };
    } catch (error) {
      return { ok: false, error: error.message };
    }
  }

  function reset() {
    try {
      localStorage.removeItem(STORAGE_KEY);
      return { ok: true };
    } catch (error) {
      return { ok: false, error: error.message };
    }
  }

  window.NJProperties = {
    key: STORAGE_KEY,
    defaultProperties: clone(defaultProperties).map(normalizeProperty),
    load,
    save,
    reset,
    normalize: normalizeProperty,
    uniquePhotos
  };
})();
