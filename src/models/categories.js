import db from './db.js';

async function getAllCategories() {
    const { rows } = await db.query('SELECT * FROM category');
    return rows;
}

export { getAllCategories };