const jwt = require('jsonwebtoken');

module.exports = {
    createTokenForUserId: async (userId) => {
        // On renvoie un JWT avec le user i d
        const jwtContent = { userId };
        const jwtSecret = process.env.AUTH_API_SECRET;
        const jwtOptions = { algorithm: 'HS256', expiresIn: '7d' };
        const token = await jwt.sign(jwtContent, jwtSecret, jwtOptions);
        return token;
    },
};
