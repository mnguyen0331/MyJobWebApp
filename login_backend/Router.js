const bcrypt = require('bcrypt');
class Router {

    constructor(app, db) {
        this.login(app, db);
        this.logout(app, db);
        this.isLoggedIn(app, db);
    }

    login(app, db) {
        app.post('/login', (req, res) => {
            let username = req.body.username;
            let password = req.body.password;

            console.log(username)

        });

    }
    logout(app, db) {

    }
    isLoggedIn(app, db) {

    }


}

module.exports=Router;