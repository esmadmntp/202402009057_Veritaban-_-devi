# Silme Politikaları (On Delete)

| Foreign key | Ebeveyn → Çocuk | Seçimi | Neden | Diğer seçenek neden olmadı |
| :--- | :--- | :--- | :--- | :--- |
| `fk_event_club` | `club → event` | `RESTRICT` | Kulüp silinirken aktif etkinlikleri varsa silinmemelidir. | `CASCADE` seçilirse kulüp silindiğinde etkinlikler de silinir. |
| `fk_registration_member` | `member → event_registration` | `CASCADE` | Üye silindiğinde katılım kayıtlarının temizlenmesi gerekir. | `RESTRICT` seçilirse kaydı olan üye silinemez. |
| `fk_registration_event` | `event → event_registration` | `CASCADE` | Etkinlik silindiğinde katılım kayıtlarının kalmasının anlamı yoktur. | `RESTRICT` seçilirse kayıtlı üyesi olan etkinlik silinemez. |
