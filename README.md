olução de Machine Learning para classificação de diabetes, desenvolvida como parte do Tech Challenge Fase 1 da Pós Tech FIAP.

**Aluna:** Letícia Monteiro de Freitas  
**RM:** RM375187  
**Repositório:** https://github.com/lelefreitas/techChallengeAI

---

## Problema

Um hospital universitário precisa de um sistema inteligente de suporte ao diagnóstico médico. O objetivo desta fase é construir a base do sistema com foco em Machine Learning, permitindo que resultados de exames sejam analisados automaticamente.

O problema abordado é a **classificação de pacientes como diabéticos ou não diabéticos** com base em dados clínicos, auxiliando médicos e equipes clínicas na triagem inicial.

> **Importante:** o modelo é uma ferramenta de apoio ao diagnóstico. O médico deve sempre ter a palavra final.

---

## Dataset

**Pima Indians Diabetes Dataset**  
Fonte: https://www.kaggle.com/datasets/mathchi/diabetes-data-set

- 768 pacientes × 9 colunas
- Target: 0 = não diabético, 1 = diabético
- Desbalanceamento moderado: 65% × 35%

---

## Resultados

| Modelo | Accuracy | Recall | F1-score |
|--------|----------|--------|----------|
| Regressão Logística | 0,71 | 0,50 | 0,55 |
| SVM | 0,74 | 0,56 | 0,60 |
| Regressão Logística balanceada | 0,73 | 0,70 | 0,65 |
| **SVM balanceado (modelo final)** | **0,73** | **0,72** | **0,65** |

O SVM com `class_weight='balanced'` foi selecionado como modelo final por apresentar o melhor Recall (0,72) para a classe diabética.

---

## Estrutura do projeto

```
techChallengeAI/
├── data/
│   ├── raw/                    ← CSV original do Kaggle (não versionado)
│   └── processed/              ← Dados após pré-processamento
│       ├── train.csv
│       └── test.csv
├── notebooks/
│   ├── 01_eda.ipynb            ← Exploração e análise dos dados
│   ├── 02_preprocessing.ipynb  ← Pré-processamento e pipeline
│   └── 03_modeling.ipynb       ← Modelagem, avaliação e SHAP
├── reports/
│   └── figures/                ← Gráficos gerados
│       ├── distribuicoes.png
│       ├── correlacao.png
│       └── shap_summary.png
├── README.md
├── Dockerfile
└── requirements.txt
```

---

## Como rodar

### Pré-requisitos

- Python 3.8+
- Git

### 1. Clone o repositório

```bash
git clone https://github.com/lelefreitas/techChallengeAI.git
cd techChallengeAI
```

### 2. Baixe o dataset

Acesse https://www.kaggle.com/datasets/mathchi/diabetes-data-set, faça o download e salve o arquivo em:

```
data/raw/diabetes.csv
```

### 3. Crie o ambiente virtual e instale as dependências

```bash
python3 -m venv .venv
source .venv/bin/activate      # Linux/Mac
# .venv\Scripts\activate       # Windows

pip install -r requirements.txt
```

### 4. Abra o Jupyter e rode os notebooks em ordem

```bash
jupyter notebook
```

Execute os notebooks na seguinte ordem:

1. `notebooks/01_eda.ipynb` — Exploração dos dados
2. `notebooks/02_preprocessing.ipynb` — Pré-processamento
3. `notebooks/03_modeling.ipynb` — Modelagem e avaliação

---

## Como rodar com Docker

### 1. Build da imagem

```bash
docker build -t tech-challenge-fase1 .
```

### 2. Rode o container

```bash
docker run -p 8888:8888 -v $(pwd):/app tech-challenge-fase1
```

### 3. Acesse no navegador

Abra o link que aparecer no terminal — algo como:

```
http://127.0.0.1:8888/?token=...
```

---

## Dependências principais

| Biblioteca | Versão | Uso |
|-----------|--------|-----|
| pandas | 2.x | Manipulação de dados |
| numpy | 1.x | Cálculo numérico |
| scikit-learn | 1.x | Modelos de ML e pipeline |
| matplotlib | 3.x | Visualizações |
| seaborn | 0.x | Heatmap de correlação |
| shap | 0.x | Interpretabilidade do modelo |
| jupyter | 1.x | Ambiente de notebooks |
| imbalanced-learn | 0.x | Tratamento de desbalanceamento |

---

## Tecnologias utilizadas

- **Python 3.8**
- **scikit-learn** — pipeline, modelos e métricas
- **SHAP** — interpretabilidade
- **Jupyter Notebook** — desenvolvimento e apresentação
- **Docker** — containerização

---

## Referências

- Smith, J. W. et al. (1988). Using the ADAP learning algorithm to forecast the onset of diabetes mellitus.
- UCI Machine Learning Repository — Pima Indians Diabetes Database
- Lundberg, S. M. & Lee, S. (2017). A unified approach to interpreting model predictions.
