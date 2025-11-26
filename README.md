
## 🚀 Configuração inicial do projeto

Antes de executar o projeto pela primeira vez, você deve configurar as variáveis de ambiente do Firebase.

1.  Crie o arquivo `.env` na raiz do projeto (entre em contato com um representante para adquirir as keys).
2.  Execute este comando para gerar o Firebase service worker (`firebase-messaging-sw.js`):

    ```sh
    dart run lib/utils/generate_firebase_sw.dart
    ```

3.  após isso, você poderá executar o projeto normalmente:.
     ```sh
      flutter run -d chrome --dart-define-from-file=.env
    ```