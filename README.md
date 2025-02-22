# container-node_exporter-textfiles

Container Image for easily running textfile exporter scripts from the Prometheus Community to be collected by the prometheus/node_exporter.


Container Image Tags:

* `main` - Latest build of the `main` branch.
* `vYYYYmmdd-HHMMSS-NNN` - Latest build of the application with date of the build.

## Credits

This docker image contains the [prometheus-community/node-exporter-textfile-collector-scripts](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts) repository, so that any script can be easily used with / from this Docker image.

## Usage

**This Docker image needs to be run in privileged mode for most of the scripts in the `prometheus-community/node-exporter-textfile-collector-scripts` repository, e.g., for `smartmon.sh` it is needed to be able to collect the SMART values.**

The entrypoint script is putting the output into the directory `/var/lib/node_exporter`, by default filename named after which script is running.

### Variables

| Name              | Default       | Description                                                      |
| ----------------- | ------------- | ---------------------------------------------------------------- |
| `SCRIPT`          | `smartmon.sh` | Which of the node_exporter textfile collector scripts to run.    |
| `OUTPUT_FILENAME` | `smartmon`    | Name of the output file (file ending must not be added `.prom`). |
| `INTERVAL`        | `300`         | Interval at which to run the script at.                          |

Any flags / args given to the container are passed to the `SCRIPT` that will be executed.

