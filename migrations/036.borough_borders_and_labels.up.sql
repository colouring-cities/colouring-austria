CREATE TABLE IF NOT EXISTS external_data_borough_boundary (
        -- internal unique id
        planning_entry_id serial PRIMARY KEY,

        -- geometry as EPSG:3857 avoiding reprojection for tiles
        geometry_id integer REFERENCES geometries,
        name VARCHAR(50)
);


/*
print("DROP TABLE IF EXISTS new_geometries;")
print("""CREATE TABLE IF NOT EXISTS new_geometries (
    source_id varchar(30),
    geometry_geom geometry(GEOMETRY, 3857)
);""")
with open('colouring-london/app/public/geometries/boroughs.geojson', 'r') as content_file:
    content = content_file.read()
    data = json.loads(content)
    for entry in data["features"]:
        identifier = entry["properties"]["name"]
        print("INSERT INTO new_geometries(source_id, geometry_geom) VALUES ('" + identifier + "', ST_Transform(ST_GeomFromGeoJSON('" + json.dumps(entry["geometry"]) + "'), 3857));")
        #print(entry["geometry"], entry["properties"]["name"], identifier)

print("""INSERT INTO geometries ( source_id, geometry_geom )
         SELECT source_id, geometry_geom
         FROM new_geometries;""")
print("""INSERT INTO external_data_borough_boundary ( geometry_id, name )
         SELECT geometry_id, source_id
         FROM geometries AS g
         WHERE EXISTS ( SELECT source_id
                        FROM new_geometries AS ng
                        WHERE g.source_id = ng.source_id);""")
print("DROP TABLE IF EXISTS new_geometries;")
*/

