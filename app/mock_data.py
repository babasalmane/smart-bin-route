from datetime import datetime
from .models import Bin

bins = [
    Bin(id="bin_01", latitude=33.981631, longitude= -6.864980, fill_level=0, last_updated=datetime.now()),
    Bin(id="bin_02", latitude=33.979715, longitude= -6.872097, fill_level=60, last_updated=datetime.now()),
    Bin(id="bin_03", latitude=33.973603, longitude=-6.872058, fill_level=30, last_updated=datetime.now()),
    Bin(id="bin_04", latitude=33.970374, longitude=-6.864405, fill_level=20, last_updated=datetime.now()),
    Bin(id="bin_05", latitude=33.982799, longitude=-6.856251, fill_level=80, last_updated=datetime.now()),
]
