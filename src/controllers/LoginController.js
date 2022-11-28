const bcrypt = require('bcrypt');

function login(req, res) {
    res.render('login/index');
}

function auth(req, res) {
    const data = req.body;
    console.log(data);
}

//En caso de querer un registro de usuarios
function storeUser(req, res) {
    const data = req.body;
    bcrypt.hash(data.password, 12).then(hash => {
        data.password = hash;
        
        req.getConnection((err, conn) => {
            conn.query('INSERT INTO users SET ?', [data], (err, rows) => {
                res.redirect('/')
            });
        });
    });
}

module.exports = {
    login,
    storeUser,
    auth,
}