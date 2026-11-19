/* NOVA AI API endpoint: configurable for the hosted backend. */
(function(){
  const fallback='http://127.0.0.1:8000';
  const saved=localStorage.getItem('nova_api_base');
  window.NOVA_API_BASE=(saved||fallback).replace(/\/+$/,'');
})();
