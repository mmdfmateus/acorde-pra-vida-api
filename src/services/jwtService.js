import jwt from 'jsonwebtoken';

const SECRET = '$2b$10$UW.gNCmZpheoco.zlnysBui5acUpZDaaDhwLUMHMvlPKXQvSljMFi';

const generate = (id) => {
    return jwt.sign({ id }, SECRET);
}

export default {
  generate
}