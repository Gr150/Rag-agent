# RAG Agent

This project is a Google Cloud ADK agent designed to answer questions using Vertex AI RAG Engine, following best practices for Cloud Run deployment.

## Project Structure

```
rag-agent/
│
├── agent_app/                # Main agent application directory
│   ├── agent.py              # Main agent code, defines `root_agent`
│   ├── __init__.py           # Should contain `from . import agent`
│   ├── prompts.py            # Any supporting code
│   └── requirements.txt      # All runtime dependencies for the agent
│
├── deployment/               # Deployment scripts and configs
│   ├── deploy.py
│   ├── grant_permissions.sh
│   └── run.py
│
├── pyproject.toml            # (Optional) For local/dev dependency management
├── poetry.lock               # (Optional) For local/dev dependency management
└── README.md                 # Project documentation
```

## Setup

1. Install dependencies:
   ```sh
   cd agent_app
   pip install -r requirements.txt
   ```

2. Set required environment variables:
   - `GOOGLE_CLOUD_PROJECT`
   - `GOOGLE_CLOUD_LOCATION`
   - `RAG_CORPUS`
   - Any other required by your agent

## Deployment (Cloud Run)

1. Authenticate with Google Cloud:
   ```sh
   gcloud auth login
   gcloud config set project <your-project-id>
   ```

2. Deploy using ADK CLI:
   ```sh
   adk deploy cloud_run --project=<your-project-id> --region=<your-region> agent_app
   ```

3. (Optional) Use additional flags as needed, e.g. `--with_ui`, `--service_name`, `--app_name`.

## Notes
- Ensure `requirements.txt` is inside the `agent_app` directory.
- The main agent variable in `agent.py` must be named `root_agent`.
- `__init__.py` must contain `from . import agent`.
- For more details, see the [ADK Cloud Run deployment docs](https://google.github.io/adk-docs/deploy/cloud-run/). 