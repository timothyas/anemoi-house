import os

from visualize import main

if __name__ == "__main__":
    inference_dir = "/pscratch/sd/t/timothys/anemoi-house/gfs/1.00-degree/latlon/inference"

    main(
        read_path=f"{inference_dir}/2023-03-09T00.240h.nc",
        store_dir=inference_dir,
        t0="2023-03-09T00",
        tf="2023-03-10T00",
        mode="figure",
    )
    main(
        read_path=f"{inference_dir}/2023-03-09T00.240h.nc",
        store_dir=inference_dir,
        t0="2023-03-09T00",
        tf="2023-03-19T00",
        mode="movie",
    )
