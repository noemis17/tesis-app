// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.


export const environment = {
  production: false,
  mapbox: {
    accessToken: '<pk.eyJ1Ijoibm9lbWkxNyIsImEiOiJja2U0eDlmbXUweGVlMnptdzhyMmhxY3NqIn0.pdK5JCeAlWgpAXIfQIKovQ>'
  },
  firebaseConfig : {
    apiKey: "AIzaSyDX4mH4TMXbceVXie1XiBw58-ksUE_eMQI",
    authDomain: "nolike-gp-developer.firebaseapp.com",
    databaseURL: "https://nolike-gp-developer.firebaseio.com",
    projectId: "nolike-gp-developer",
    storageBucket: "nolike-gp-developer.appspot.com",
    messagingSenderId: "972104619745",
    appId: "1:972104619745:web:16ad5936e2283ccd5649a0"
  },
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.

// export const server ="https://cryptic-journey-10931.herokuapp.com/api";
export const server ="http://25.39.0.74:8000/api";
// export const server ="http://127.0.0.1:8000/api";


