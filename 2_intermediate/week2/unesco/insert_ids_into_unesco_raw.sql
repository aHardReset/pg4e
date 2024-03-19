UPDATE unesco_raw SET category_id=(SELECT category.id FROM category WHERE unesco_raw.category = category.name);
UPDATE unesco_raw SET iso_id=(SELECT iso.id FROM iso WHERE unesco_raw.iso = iso.name);
UPDATE unesco_raw SET region_id=(SELECT region.id FROM region WHERE unesco_raw.region = region.name);
UPDATE unesco_raw SET state_id=(SELECT state.id FROM state WHERE unesco_raw.state = state.name);
