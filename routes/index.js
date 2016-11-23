/*====================      The redirecting file to index.ejs,     50% Temporary page,    In the future this page could be  deleted   ==============*/
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Great TEAM' });
};