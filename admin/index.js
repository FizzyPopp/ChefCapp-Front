#!/usr/bin/env node

var admin = require('firebase-admin')
var fs = require('fs')
var path = require('path')
var functions = require('firebase-functions')

const app = admin.initializeApp({
    credential: admin.credential.applicationDefault(),
    databaseURL: "https://chef-capp.firebaseio.com"
})

const db = admin.firestore();
const rtRef = db.collection('recipe-test');


exports.db = db;
exports.app = app;
exports.rtRef = rtRef;

exports.test = function (collectionRef) {
    let allDocs = collectionRef.get()
    .then(snapshot => {
        snapshot.forEach(doc => {
            console.log(doc.id, ':', doc.data());
        });
    })
    .catch(err => {
        console.log('Error getting documents', err);
    });
    return allDocs;
}
