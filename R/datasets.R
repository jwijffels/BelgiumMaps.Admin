
#' @name BE_OSM_ADMIN
#' @title BE_OSM_ADMIN: Administrative boundaries of Belgium based on OpenStreetMap
#' @description BE_OSM_ADMIN: SpatialPolygonsDataFrame with administrative boundaries of Belgium. Extracted on 2015/11/03. 
#' It contains polygons of all administrative boundaries (levels 2, 4, 6, 7, 8, 9). 
#' Polygons are stored in degrees latitude/longitude (EPSG:4326 WGS 84).
#' The data slot in the SpatialPolygonsDataFrame contains the following fields:
#' 
#' The OpenStreetMap data of Belgium (belgium-latest.osm.pbf as of 2015-11-02T22:22:02Z) was imported in PostGIS using 
#' osm2pgsql and next with pgsql2shp, the data were converted to a shapefile.
#' 
#' SQL: select osm_id, boundary, admin_level, name, way_area, way, id, way_off, rel_off, parts, members, rels.tags from 
#' (select * from planet_osm_polygon where boundary = 'administrative' and admin_level IN ('2', '4', '6', '7', '8', '9')) polygon left outer join 
#' (select * from planet_osm_rels) as rels 
#' on -polygon.osm_id = rels.id;
#' 
#' \itemize{
#' \item osm.id: the OpenStreetMap id of the polygon 
#' \item boundary: the boundary OpenStreetMap tag of the polygon: always administrative
#' \item admin.level: the admin_level OpenStreetMap tag of the polygon: either 2, 4, 6, 7, 8, 9 (national, regions, provinces, districts, municipalities, nissections)
#' \item name: the OpenStreetMap name of the polygon
#' \item way.off: part of the planet_osm_rels table
#' \item rel.off: part of the planet_osm_rels table
#' \item parts: ways field, part of the planet_osm_rels table
#' \item members: members field, part of the planet_osm_rels table
#' \item tags: tags field, part of the planet_osm_rels table
#' \item tag.type: type tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.admin.level: admin_level tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.boundary: boundary tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.name: name tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.name.nl: name:nl tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.name.fr: name:fr tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.official.name: official_name tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.official.name.nl: official_name:nl tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.official.name.fr: official_name:fr tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.wikipedia.fr: wikipedia:fr tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.addr.postcode: addr:postcode tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.ref.ins: ref:INS tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.old.ref.ins: old_ref:INS tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.wikipedia: wikipedia tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.wikidata: wikidata tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.website: website tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' \item tag.is.in: is_in tag, extracted using \code{tag_extractor} from the tags field of the planet_osm_rels table
#' }
#' 
#' Mark that the OpenStreetMap data at administrative level 9 seems to be incomplete.
#' Mark also that several polygons can exist for the same boundary.
#' @docType data
#' @references \url{http://wiki.openstreetmap.org/wiki/Tag:boundary=administrative}, 
#' \url{http://download.geofabrik.de/europe/belgium.html}, 
#' \url{https://en.wikipedia.org/wiki/World_Geodetic_System}
#' @examples
#' \dontrun{
#' data(BE_OSM_ADMIN)
#' str(as.data.frame(BE_OSM_ADMIN))
#' 
#' library(sp)
#' plot(BE_OSM_ADMIN)
#' plot(subset(BE_OSM_ADMIN, admin.level %in% "2"))
#' plot(subset(BE_OSM_ADMIN, admin.level %in% "4"))
#' plot(subset(BE_OSM_ADMIN, admin.level %in% "6"))
#' plot(subset(BE_OSM_ADMIN, admin.level %in% "7"))
#' plot(subset(BE_OSM_ADMIN, admin.level %in% "8"))
#' plot(subset(BE_OSM_ADMIN, admin.level %in% "9"))
#' }
NULL