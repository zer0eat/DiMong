# AI 모델의 성능



정밀도(Precision), 재현율(Recall), F1 score 및 ROC curve는 모두 머신 러닝 및 분류 문제에서 모델의 성능을 측정하는 데 사용되는 메트릭(metric)입니다.

1. 정밀도(Precision):
   정밀도는 모델이 양성이라고 예측한 샘플 중에서 실제로 양성인 것의 비율입니다. 즉, 모델이 예측한 양성 결과가 정확한 정도를 나타내는 지표입니다.
   정밀도 = TP / (TP + FP)
   여기서, TP는 true positive 즉, 모델이 정확히 예측한 양성 샘플의 수, FP는 false positive 즉, 모델이 잘못 예측한 양성 샘플의 수입니다.

2. 재현율(Recall):
   재현율은 실제 양성인 샘플 중에서 모델이 정확하게 예측한 양성 샘플의 비율입니다.
   재현율 = TP / (TP + FN)
   여기서, TP는 true positive 즉, 모델이 정확히 예측한 양성 샘플의 수, FN은 false negative 즉, 모델이 잘못 예측한 음성 샘플의 수입니다.

3. F1 score:
   정밀도와 재현율은 각각 모델의 예측 결과의 정확성과 모델이 실제 양성을 잘 예측할 수 있는 능력을 나타냅니다. F1 score는 이 둘을 하나로 합친 지표로서, 모델의 성능을 종합적으로 평가하는 데 사용됩니다.
   F1 score = 2 * (precision * recall) / (precision + recall)

4. ROC curve:
   ROC curve는 이진 분류 모델에서 사용되며, 모델의 임계값(threshold)을 조정하여 모델의 성능을 분석합니다. ROC curve는 x축에 false positive rate(FPR)를, y축에 true positive rate(TPR)를 나타내며, 이 두 가지 지표를 기반으로 그려집니다. ROC curve의 면적인 AUC(Area Under the Curve)는 모델의 성능을 나타내는 하나의 지표로 사용됩니다.

---

밀도, 재현율, F1 score 및 ROC curve를 사용하는 방법은 다음과 같습니다.

1. 정밀도, 재현율 및 F1 score:
- 데이터셋을 훈련셋과 테스트셋으로 분할합니다.
- 모델을 학습시킵니다.
- 테스트셋에서 모델의 예측 결과를 얻습니다.
- 정밀도, 재현율 및 F1 score를 계산합니다.
- 모델의 성능을 평가합니다.

예를 들어, 다음과 같은 코드를 사용하여 정밀도, 재현율 및 F1 score를 계산할 수 있습니다.

```python
from sklearn.metrics import precision_score, recall_score, f1_score

# y_true: 실제 레이블, y_pred: 모델의 예측 결과
precision = precision_score(y_true, y_pred)
recall = recall_score(y_true, y_pred)
f1 = f1_score(y_true, y_pred)
```

2. ROC curve:
- 데이터셋을 훈련셋과 테스트셋으로 분할합니다.
- 모델을 학습시킵니다.
- 테스트셋에서 모델의 예측 결과를 얻습니다.
- ROC curve를 그립니다.
- AUC 값을 계산하여 모델의 성능을 평가합니다.

예를 들어, 다음과 같은 코드를 사용하여 ROC curve와 AUC 값을 계산할 수 있습니다.

```python
from sklearn.metrics import roc_curve, auc

# y_true: 실제 레이블, y_pred: 모델의 예측 결과
fpr, tpr, thresholds = roc_curve(y_true, y_pred)
roc_auc = auc(fpr, tpr)
```

이렇게 계산된 정밀도, 재현율, F1 score 및 ROC curve의 결과를 토대로 모델의 성능을 분석하고 개선할 수 있습니다.
