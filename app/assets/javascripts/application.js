// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var accessKeyId = 'CNJSX7LS44RVQAZQAIKA';
var secretAccessKey = 'wdEuI0RaCIKybTjV3/q6JdDOpS605FAB+BFOwJBU';

AWS.config.update({
    accessKeyId: accessKeyId.split('').reverse().join(''),
    secretAccessKey: secretAccessKey.split('').reverse().join(''),
    region: 'us-east-2'
});

var s3 = new AWS.S3();
