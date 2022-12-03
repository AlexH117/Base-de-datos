const bcrypt = require('bcrypt');
const e = require('express');
const { isMatch } = require('picomatch');

function login(req, res) {
    res.render('login/index');
}

function auth(req, res) {
    const data = req.body;
    
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM users WHERE email = ?', [data.email], (err, userdata) => {

            if(userdata.length > 0) {

                userdata.forEach(element => {
                    bcrypt.compare('1234', element.password, (err, isMatch) => {

                        console.log(userdata);
                        /*
                        if(!isMatch) {
                            res.render('login/index', { error: 'Error: Contraseña incorrecta !'});
                        } else {
                            console.log('welcome');
                        }
                        */

                    });
                }); 
            } else {
                res.render('login/index', { error: 'Error: El usuario no existe !'});
            }
        });
    });
}

//En caso de querer un registro de usuarios
function storeUser(req, res) {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM users WHERE email = ?', [dara.email], (err, userdata) => {
            if (userdata.length > 0) {
                res.render('login/register', {error: 'Error: El usuario ya existe !'});
            } else {
                bcrypt.hash(data.password, 12).then(hash => {
                    data.password = hash;

                    req.getConnection((err, conn) => {
                        conn.query('INSERT INTO users SET ?', [data], (err, rows) => {
                            res.redirect('/')
                        });
                    });
                });
            }
        });
    });
}

module.exports = {
    login,
    storeUser,
    auth,
}