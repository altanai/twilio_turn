module.exports = {
    apps : [{
        name: "twilio_token",
        script: 'token.js',
        watch: ["server", "client"],
        watch_delay: 1000,
        env: {
            "NODE_ENV": "prod"
        },
        env_prod: {
            "NODE_ENV": "prod"
        },
        env_hehllo: {
            "NODE_ENV": "hehllo"
        },
        env_dev: {
            "NODE_ENV": "dev"
        },
        env_test : {
            "NODE_ENV": "test"
        }
    }],

    deploy : {
        prod : {
            user : 'ubuntu',
            host : '*',
            ref  : 'origin/master',
            repo : 'twilio_turn',
            path : '/home/ubuntu/',
            'pre-deploy-local': '',
            'post-deploy' : 'npm install && pm2 reload ecosystem.config.js --env prod',
            'pre-setup': ''
        }
    }
};
