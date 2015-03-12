"use strict";
function Barcode() {
}

Barcode.prototype.readBarcode = function (successCallback, errorCallback) {
  cordova.exec(successCallback, errorCallback, "Barcode", "readBarcode");
};

Barcode.install = function () {
  if (!window.plugins) {
    window.plugins = {};
  }

  window.plugins.Barcode = new Barcode();
  return window.plugins.Barcode;
};

cordova.addConstructor(Barcode.install);
