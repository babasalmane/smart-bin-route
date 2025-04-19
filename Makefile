
OSRM_DIR = $(shell pwd)/maps
OSM_FILE = $(shell pwd)/maps/morocco-latest.osm.pbf
OSRM_PREFIX = morocco-latest.osrm
EXTS = cnbg cnbg_to_ebg ebg ebg_nodes edges enw fileIndex geometry icd maneuver_overrides names nbg_nodes properties ramIndex restrictions timestamp tld tls turn_duration_penalties turn_penalties_index turn_weight_penalties
# Génère la liste complète des fichiers à vérifier
OSRM_FILES = $(foreach ext,$(EXTS),$(OSRM_DIR)/$(OSRM_PREFIX).$(ext))

extract: $(OSRM_FILES)

$(OSRM_DIR)/$(OSRM_PREFIX).cnbg: $(OSM_FILE)
	docker run -t -v $(OSRM_DIR):/data -v $(OSRM_DIR):/maps osrm/osrm-backend \
		osrm-extract -p /opt/car.lua /maps/$(notdir $(OSM_FILE))

# Étape 2 : contract
contract: $(OSRM_DIR)/$(OSRM_PREFIX).hsgr

$(OSRM_DIR)/$(OSRM_PREFIX).mld: $(OSRM_DIR)/morocco-latest.osrm
        docker run -t -v $(OSRM_DIR):/data osrm/osrm-backend \
                osrm-contract /data/morocco-latest.osrm

# Étape 3 : serve
serve:
	docker run -t -i -p 5000:5000 -v $(OSRM_DIR):/data osrm/osrm-backend \
        	osrm-routed --algorithm mld /data/morocco-latest.osrm
# Étape 4 : api
api:
	uvicorn app.main:app --reload


