import mlflow
from mlflow.tracking import MlflowClient

# 1. Set the tracking URI to the location from your meta.yaml
tracking_uri = "file:///pscratch/sd/t/timothys/anemoi-house/gfs/1.00-degree/offline/logs/mlflow"
mlflow.set_tracking_uri(tracking_uri)

# The experiment_id from your meta.yaml
experiment_id = "848913118703853968"

# 2. Get the run ID for the desired run
# We'll get the first run in the experiment for this example
runs_df = mlflow.search_runs(experiment_ids=[experiment_id])
if runs_df.empty:
    print("No runs found for this experiment.")
else:
    run_id = runs_df.loc[0, 'run_id']
    print(f"Found a run with ID: {run_id}")

    # 3. Instantiate the MLflow Client
    client = MlflowClient()

    # 4. Fetch the history of the 'loss' metric
    metric_history = client.get_metric_history(run_id, "train_mse_loss_step")

    # Now, you can iterate through the history to access all values
    print("\nAll logged 'loss' values:")
    for metric in metric_history:
        print(f"Step: {metric.step}, Value: {metric.value}, Timestamp: {metric.timestamp}")

    # If you prefer to have the data in a list or pandas Series
    loss_values = [metric.value for metric in metric_history]
    print("\nLoss values as a list:", loss_values)
