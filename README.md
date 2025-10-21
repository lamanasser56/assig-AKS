# E-commerce Application - CI/CD with GitHub Actions

This repository contains a full-stack e-commerce application with automated CI/CD pipeline using GitHub Actions, Azure Container Registry (ACR), and Azure Kubernetes Service (AKS).

##  Architecture

- **Frontend**: React + TypeScript + Tailwind CSS
- **Backend**: Node.js + Express + TypeScript
- **Database**: Azure SQL Database
- **Container Registry**: Azure Container Registry (ACR)
- **Orchestration**: Azure Kubernetes Service (AKS)
- **CI/CD**: GitHub Actions with Service Principal authentication

##  Prerequisites

### Azure Resources
- Azure subscription with appropriate permissions
- Resource Group: shop-lama-rg
- AKS Cluster: shop-lama-aks
- ACR: manaracr.azurecr.io
- Azure SQL Database

### Local Development
- Node.js 18+
- Docker
- kubectl
- Azure CLI

##  GitHub Secrets Setup

### Required Secrets

Create the following secrets in your GitHub repository (Settings > Secrets and variables > Actions):

#### Azure Service Principal Authentication
`
AZURE_CLIENT_ID          # Service Principal Client ID
AZURE_CLIENT_SECRET      # Service Principal Client Secret
AZURE_SUBSCRIPTION_ID    # Azure Subscription ID
AZURE_TENANT_ID          # Azure Tenant ID
`

#### Azure Container Registry
`
ACR_LOGIN_SERVER         # e.g., manaracr.azurecr.io
ACR_USERNAME             # ACR username
ACR_PASSWORD             # ACR password
`

#### Database Configuration
`
SQL_SERVER               # Azure SQL Server FQDN
SQL_DATABASE             # Database name
SQL_ADMIN_LOGIN          # SQL admin username
SQL_ADMIN_PASSWORD       # SQL admin password
DB_ENCRYPT               # true/false
DB_TRUST_SERVER_CERTIFICATE  # true/false
DB_CONNECTION_TIMEOUT    # Connection timeout in ms
`

#### Application Configuration
`
JWT_SECRET               # JWT signing secret
CORS_ORIGIN              # Allowed CORS origins
RATE_LIMIT_WINDOW_MS     # Rate limit window (ms)
RATE_LIMIT_MAX_REQUESTS  # Max requests per window
REACT_APP_API_URL        # Frontend API URL
`

##  How to Run

### 1. Clone the Repository
`ash
git clone https://github.com/lamanasser56/assig-AKS.git
cd assig-AKS
`

### 2. Local Development Setup

#### Backend Setup
`ash
cd ecommerce-app-backend
npm install
cp .env.example .env  # Configure your environment variables
npm run dev
`

#### Frontend Setup
`ash
cd ecommerce-app-frontend
npm install
cp .env.example .env  # Configure your environment variables
npm start
`

### 3. Docker Build (Local)
`ash
# Build backend
cd ecommerce-app-backend
docker build -t lama-backend .

# Build frontend
cd ../ecommerce-app-frontend
docker build -t lama-frontend .
`

### 4. Kubernetes Deployment (Local)
`ash
# Apply namespace
kubectl apply -f k8s/namespace.yaml

# Apply backend
kubectl apply -f k8s/backend/

# Apply frontend
kubectl apply -f k8s/frontend/
`

##  CI/CD Pipeline

### Automated Workflows

#### 1. Main CI/CD Pipeline (.github/workflows/ci-cd.yml)
- **Trigger**: Push to main or develop branches
- **Actions**:
  - Build and push Docker images to ACR
  - Deploy to AKS (only on main branch)
  - Run tests on pull requests

#### 2. Manual Deploy (.github/workflows/manual-deploy.yml)
- **Trigger**: Manual workflow dispatch
- **Features**:
  - Environment selection (production/staging)
  - Custom image tag selection
  - Skip tests option

#### 3. Database Migration (.github/workflows/db-migration.yml)
- **Trigger**: Manual workflow dispatch
- **Features**:
  - Initialize database
  - Run migrations
  - Seed data

### Workflow Triggers

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| CI/CD | Push to main/develop | Automated build and deploy |
| CI/CD | Pull Request | Run tests and linting |
| Manual Deploy | Manual dispatch | Deploy specific version |
| DB Migration | Manual dispatch | Database operations |

##  Variables and Configuration

### Environment Variables

#### Backend Environment Variables
`ash
DB_SERVER=your-sql-server.database.windows.net
DB_NAME=your-database-name
DB_USER=your-sql-username
DB_PASSWORD=your-sql-password
DB_ENCRYPT=true
DB_TRUST_SERVER_CERTIFICATE=true
DB_CONNECTION_TIMEOUT=30000
JWT_SECRET=your-jwt-secret
CORS_ORIGIN=http://localhost:3000,https://your-domain.com
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
NODE_ENV=production
PORT=3001
`

#### Frontend Environment Variables
`ash
REACT_APP_API_URL=https://your-api-domain.com
`

### Kubernetes Configuration

#### Namespace
- **Namespace**: shop-lama
- **Resource Group**: shop-lama-rg
- **Cluster**: shop-lama-aks

#### Image References
- **Backend**: manaracr.azurecr.io/lama-backend:latest
- **Frontend**: manaracr.azurecr.io/lama-frontend:latest

##  Verification Steps

### 1. Verify GitHub Secrets
`ash
# Check if all required secrets are configured
# Go to: Repository Settings > Secrets and variables > Actions
# Ensure all secrets from the "Required Secrets" section are present
`

### 2. Verify Azure Resources
`ash
# Login to Azure
az login

# Check AKS cluster
az aks list --resource-group shop-lama-rg

# Check ACR
az acr list --resource-group shop-lama-rg

# Check SQL Database
az sql server list --resource-group shop-lama-rg
`

### 3. Verify Kubernetes Deployment
`ash
# Get AKS credentials
az aks get-credentials --resource-group shop-lama-rg --name shop-lama-aks

# Check pods
kubectl get pods -n shop-lama

# Check services
kubectl get services -n shop-lama

# Check ingress
kubectl get ingress -n shop-lama

# Check logs
kubectl logs -l app=backend -n shop-lama
kubectl logs -l app=frontend -n shop-lama
`

### 4. Verify Application Health
`ash
# Get ingress IP
INGRESS_IP=

# Test frontend
curl -I http://

# Test backend API
curl -I http:///api/health
`

### 5. Verify CI/CD Pipeline
1. Create a test branch: git checkout -b test-ci-cd
2. Make a small change and push: git push origin test-ci-cd
3. Create a pull request
4. Check GitHub Actions tab for test results
5. Merge to main branch
6. Check GitHub Actions tab for deployment results

##  Troubleshooting

### Common Issues

#### 1. Authentication Errors
`ash
# Re-authenticate with Azure
az logout
az login

# Verify service principal permissions
az role assignment list --assignee <service-principal-id>
`

#### 2. Docker Build Failures
`ash
# Check Dockerfile syntax
docker build --no-cache -t test-image .

# Check for missing dependencies
npm audit
`

#### 3. Kubernetes Deployment Issues
`ash
# Check pod status
kubectl describe pods -n shop-lama

# Check events
kubectl get events -n shop-lama --sort-by='.lastTimestamp'

# Check resource usage
kubectl top pods -n shop-lama
`

#### 4. Database Connection Issues
`ash
# Test database connectivity
kubectl run test-db --image=mcr.microsoft.com/mssql-tools -n shop-lama --rm -it -- /bin/bash
# Inside pod: sqlcmd -S <server> -U <user> -P <password> -d <database>
`

### Debug Commands

`ash
# Check GitHub Actions logs
# Go to: Repository > Actions > Select workflow run > View logs

# Check Kubernetes logs
kubectl logs -f deployment/backend-deployment -n shop-lama
kubectl logs -f deployment/frontend-deployment -n shop-lama

# Check resource status
kubectl get all -n shop-lama

# Check secrets and configmaps
kubectl get secrets -n shop-lama
kubectl get configmaps -n shop-lama
`

##  Additional Resources

- [Azure Kubernetes Service Documentation](https://docs.microsoft.com/en-us/azure/aks/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Azure Container Registry Documentation](https://docs.microsoft.com/en-us/azure/container-registry/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)

##  Contributing

1. Fork the repository
2. Create a feature branch: git checkout -b feature/new-feature
3. Make your changes
4. Run tests: 
pm test
5. Commit your changes: git commit -m 'Add new feature'
6. Push to the branch: git push origin feature/new-feature
7. Create a Pull Request

##  License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
