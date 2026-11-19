import db from './db.js';

const getAllCategories = async () => {
    const { rows } = await db.query('SELECT * FROM category');
    return rows;
};

const getCategoryById = async (categoryId) => {
    const query = `
        SELECT category_id, name
        FROM category
        WHERE category_id = $1;
    `;
    const { rows } = await db.query(query, [categoryId]);

    return rows.length > 0 ? rows[0] : null;
};

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT category.category_id, category.name
        FROM category
        JOIN service_project_category
            ON category.category_id =
               service_project_category.category_id
        WHERE service_project_category.project_id = $1
        ORDER BY category.name;
    `;
    const { rows } = await db.query(query, [projectId]);

    return rows;
};

const assignCategoryToProject = async(categoryId, projectId) => {
    const query = `
        INSERT INTO service_project_category (category_id, project_id)
        VALUES ($1, $2);
    `;

    await db.query(query, [categoryId, projectId]);
}

const updateCategoryAssignments = async(projectId, categoryIds) => {
    // First, remove existing category assignments for the project
    const deleteQuery = `
        DELETE FROM service_project_category
        WHERE project_id = $1;
    `;
    await db.query(deleteQuery, [projectId]);

    // Next, add the new category assignments
    for (const categoryId of categoryIds) {
        await assignCategoryToProject(categoryId, projectId);
    }
}

export { getAllCategories, getCategoryById, getCategoriesByProjectId, updateCategoryAssignments };