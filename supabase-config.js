(function () {
  const SUPABASE_URL = "https://vczgmwvsmiswopitjpfh.supabase.co";
  const SUPABASE_PUBLISHABLE_KEY = "sb_publishable_kug8Q4o3-A4gyJf-kBRUhQ_yQVstUz5";

  if (window.supabase && typeof window.supabase.createClient === "function") {
    window.supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY);
  }
})();
