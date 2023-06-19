# Exploratory (Spatial) Data Analysis for Rice Yields in the Indo-Gangetic Plains – 2018-19

## Data Description
- Plot-level data on rice production practices
- Pertains to the 2018 Kharif season.
- Covers eight Indian states: Andhra Pradesh, Bihar, Chhattisgarh, Haryana, Odisha, Punjab, Uttar Pradesh, and West Bengal.
- All plots are geo-coded with an accuracy of <10 metres.
- Provided by the International Maize and Wheat Improvement Center (CIMMYT).
- Detailed information on the sampling design can be found in [Ajay et al. 2022](link-to-publication).
- Similar data for wheat is also available (Ajay et al. 2021).
- Our focus: Rice Production

## Summary Statistics

### Crop Yield Density (Raw)
- N (Plots): 5733
- Mean: 18.41
- Standard Deviation: 6.21
- Minimum: 1.5
- P25: 14.3
- P50: 18
- P75: 21.81
- P90: 27.2
- Maximum: 45.05

### Crop Yield by Soil Texture
Clearly, plots with lighter soils have lower yields as compared to plots with heavier soils.

| Categories   | Difference in Mean Yield (Standard Error) |
|--------------|------------------------------------------|
| Medium - Light | 2.78*** (0.32)                           |
| Heavy - Light  | 3.90*** (0.39)                           |
| Heavy - Medium | 1.12*** (0.24)                           |

- Light: 387
- Medium: 4,607
- Heavy: 739

### Crop Yield by Perceived Soil Quality
Clearly, plots with lower (perceived) soil quality have lower yields as compared to plots with better (perceived) soils. However, perceived soil quality does not display a clear relationship with yields.

- For example, the plots with lower quality soils exhibit a bi-modal yield distribution with higher yield values coinciding with high-quality soils as well.

| Categories   | Difference in Mean Yield (Standard Error) |
|--------------|------------------------------------------|
| Medium – Low | 2.99*** (0.42)                           |
| High – Low   | 4.22*** (0.51)                           |
| High – Medium| 1.22*** (0.32)                           |

- Low: 225
- Medium: 5,093
- High: 415

### Crop Yield by Social Categories
| Categories    | Difference in Mean Yield (Standard Error) |
|---------------|------------------------------------------|
| OBC – SC/ST   | 0.96*** (0.22)                           |
| General – SC/ST| 3.99*** (0.23)                           |
| General – OBC | 3.02*** (0.17)                           |

- SC/ST: 995
- OBC: 2,443
- General: 2,290

### Crop Yield by Soil Drainage Class
Upland soils are generally "well-drained" and do not have as much surface water accumulation, which is important for the rice crop. At the same time, upland rice varieties are (largely) more drought-tolerant compared to low-land varieties.

| Categories   | Difference in Mean Yield (Standard Error) |
|--------------|------------------------------------------|
| Medium – Low | 2.32*** (0.20)                           |
| Up – Low     | 0.30 (0.38)                              |
| Up – Medium  | -2.02*** (0.35)                          |

- Low: 1,188
- Medium: 4,223
- Up: 322

### Crop Yield by Season (Aman and Boro occur only in West Bengal)
| Categories  | Difference in Mean Yield (Standard Error) |
|-------------|------------------------------------------|
| Boro – Aman | 2.03** (0.59)                            |
| Kharif – Aman| -0.22 (0.25)                             |
| Kharif – Boro| -2.25*** (0.55)                          |

- Aman: 709
- Boro: 131
- Kharif: 4,892

#@# Crop Yield by Variety
Rice yields from hybrid and improved quality seeds are, on average, higher than the yields from local seeds.

| Categories     | Difference in Mean Yield (Standard Error) |
|----------------|------------------------------------------|
| Hybrid – Local | 1.62** (0.40)                            |
| Improved – Local| 2.30*** (0.38)                           |
| Improved – Hybrid| 0.68*** (0.19)                          |

- Local: 287
- Hybrid: 1,493
- Improved: 3,943

#@# Crop Yield by Land Ownership
| Categories    | Difference in Mean Yield (SE) |
|---------------|-------------------------------|
| Leased – Contract Farmed | -0.04 (0.66)       |
| Owned – Contract Farmed  | 0.74 (0.64)        |
| Owned – Leased           | 0.79*** (0.23)     |

- Contract Farmed: 97
- Leased: 841
- Owned: 4,795
