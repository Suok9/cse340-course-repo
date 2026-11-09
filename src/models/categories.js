import db from './db.js';

const getAllCategories = async () => {
    const { rows } = await db.query('SELECT * FROM category');
    return rows;
};

export { getAllCategories };