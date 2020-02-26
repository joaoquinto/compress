'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets\AssetManifest.json": "010f40c920859bcaa5ba5b6695de24e9",
"/assets\FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets\fonts\MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets\images\compress\cilindro.png": "42b10f98b262de09158473081058c712",
"/assets\images\compress\eng.png": "f2abdbcd9b1ebf6bc2879d5cb1b8067f",
"/assets\images\compress\Tc.gif": "6cd0b70ac823c177b2882a82fa25d9b0",
"/assets\images\compress\Vcam.png": "7341e4cdc01dcb3b22b49750392cdfbb",
"/assets\LICENSE": "2b30a222f338b5b4103db4affb16007e",
"/assets\packages\cupertino_icons\assets\CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/icons\Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons\Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/index.html": "b7d4a479cd81aac4a5d3f29929e32f27",
"/main.dart.js": "60baa859c08567a0c594a46ca01ecd6b",
"/manifest.json": "596d12433411793da1253a524985cee5"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
