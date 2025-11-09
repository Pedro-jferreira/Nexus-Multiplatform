importScripts('https://www.gstatic.com/firebasejs/9.22.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.22.2/firebase-messaging-compat.js');

firebase.initializeApp({
    apiKey: "API_KEY_WEB",
    authDomain: "PROJECT_ID.firebaseapp.com",
    projectId: "PROJECT_ID",
    storageBucket: "PROJECT_ID.appspot.com",
    messagingSenderId: "MESSAGING_SENDER_ID",
    appId: "APP_ID_WEB",
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
    console.log('[firebase-messaging-sw.js] 🎯 Recebeu mensagem em background:', payload);

    const notificationTitle = payload.notification?.title || 'Nova notificação';
    const notificationOptions = {
        body: payload.notification?.body || '',
        icon: '/icons/Icon-192.png',
        data: payload.data, // mantém dados extras para navegação
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
});

self.addEventListener('notificationclick', function (event) {
    event.notification.close();

    const targetUrl = event.notification.data?.route || '/';
    event.waitUntil(clients.openWindow(targetUrl));
});