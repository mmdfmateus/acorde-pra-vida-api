import bcrypt from 'bcrypt';

const SALT = 10;

const encrypt = async (text) => {
  return await bcrypt.hash(text, SALT);
}

const compare = async (value, hashedValue) => {
  return await bcrypt.compare(value, hashedValue);
}

export default {
  encrypt,
  compare
}
