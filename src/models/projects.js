import db from './db.js';

async function getAllProjects() {
    const result = await db.query(`
        SELECT
            service_project.project_id,
            service_project.title,
            service_project.description,
            service_project.location,
            service_project.date,
            organization.name AS organization_name
        FROM service_project
        JOIN organization
        ON service_project.organization_id =
           organization.organization_id
        ORDER BY service_project.date;
    `);

    return result.rows;
}

export { getAllProjects };