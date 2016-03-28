/*global cordova, module*/

module.exports = {
    authenticateWithState: function (clientId, redirectUri, state, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Mdp", "authenticateWithState", [clientId, redirectUri, state]);
    }
};
