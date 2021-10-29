"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
exports.__esModule = true;
exports.info = void 0;
var lodash_1 = __importDefault(require("lodash"));
var info = function (message) {
    console.log(new Date().toISOString(), lodash_1["default"].toUpper(message));
};
exports.info = info;
