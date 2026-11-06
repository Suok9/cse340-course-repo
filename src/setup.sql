CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);


INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');



CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,

    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
);
  
INSERT INTO service_project
(organization_id, title, description, location, date)
VALUES 

(1, 'Community Park Renovation', 'Volunteers will help renovate the local community park by planting trees, painting benches, and cleaning up the area.', 'Central Park, Springfield', '2024-07-15'),
(1, 'Neighborhood Cleanup', 'Join us for a community cleanup event to beautify our streets and parks.', 'Downtown Springfield', '2024-07-22'),
(1, 'Playground Construction', 'Help build a new playground for children in the community.', 'Maple Street Park, Springfield', '2024-08-05'),
(1, 'Community Mural Painting', 'Participate in painting a mural that reflects the spirit of our neighborhood.', 'Springfield Art District', '2024-08-20'),
(1, 'Recycling Awareness Campaign', 'Assist in organizing an awareness campaign to promote recycling in the community.', 'Various Locations, Springfield', '2024-09-10'),

(2, 'Urban Garden Workshop', 'A hands-on workshop teaching residents how to start their own urban gardens and grow fresh produce.', 'GreenHarvest Community Center, Springfield', '2024-08-10'),
(2, 'Composting Workshop', 'Learn how to compost at home and reduce waste.', 'GreenHarvest Community Center, Springfield', '2024-08-15'),
(2, 'Farm-to-Table Event', 'Experience a farm-to-table dinner showcasing local produce.', 'GreenHarvest Farm, Springfield', '2024-09-01'),
(2, 'Community Seed Swap', 'Exchange seeds with fellow gardeners and learn about different plant varieties.', 'GreenHarvest Community Center, Springfield', '2024-09-12'),
(2, 'Urban Beekeeping Seminar', 'Discover the benefits of urban beekeeping and how to start your own hive.', 'GreenHarvest Community Center, Springfield', '2024-09-25'),

(3, 'Charity Food Drive', 'Organizing a food drive to collect non-perishable items for local food banks.', 'UnityServe Headquarters, Springfield', '2024-09-05'),
(3, 'Senior Assistance Program', 'Volunteers will assist seniors with daily tasks and companionship.', 'Various Senior Centers, Springfield', '2024-07-30'),
(3, 'Youth Mentorship Program', 'Mentor local youth through educational and recreational activities.', 'UnityServe Headquarters, Springfield', '2024-08-12'),
(3, 'Community Health Fair', 'Organize a health fair providing free screenings and wellness resources.', 'Springfield Community Center', '2024-08-28'),
(3, 'Holiday Toy Drive', 'Collect and distribute toys to children in need during the holiday season.', 'UnityServe Headquarters, Springfield', '2024-12-01');




CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO category (name)
VALUES
('Environmental Conservation'),
('Community Development'),
('Education and Mentorship');

CREATE TABLE service_project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    CONSTRAINT fk_project
        FOREIGN KEY (project_id)
        REFERENCES service_project(project_id),
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

INSERT INTO service_project_category (project_id, category_id)
VALUES
(1, 1), -- Community Park Renovation -> Environmental Conservation
(2, 1), -- Neighborhood Cleanup -> Environmental Conservation
(3, 2), -- Playground Construction -> Community Development
(4, 2), -- Community Mural Painting -> Community Development
(5, 1), -- Recycling Awareness Campaign -> Environmental Conservation
(6, 1), -- Urban Garden Workshop -> Environmental Conservation
(7, 1), -- Composting Workshop -> Environmental Conservation
(8, 2), -- Farm-to-Table Event -> Community Development
(9, 3), -- Community Seed Swap -> Education and Mentorship
(10, 1), -- Urban Beekeeping Seminar -> Environmental Conservation
(11, 2), -- Charity Food Drive -> Community Development
(12, 3), -- Senior Assistance Program -> Education and Mentorship
(13, 3), -- Youth Mentorship Program -> Education and Mentorship
(14, 2), -- Community Health Fair -> Community Development
(15, 2); -- Holiday Toy Drive -> Community Development  

