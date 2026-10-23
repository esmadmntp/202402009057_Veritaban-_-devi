# İlişkisel Cebir ve Sorular

1. **Soru:** Kapasitesi 50'den büyük etkinliklerin adları
   * **İlişkisel Cebir:** $\pi_{title} (\sigma_{capacity > 50} (event))$
2. **Soru:** Her kaydın üye adı ve etkinlik adı
   * **İlişkisel Cebir:** $\pi_{full\_name, title} (member \bowtie event\_registration \bowtie event)$
3. **Soru:** Yazılım veya Dans kulübünün etkinliklerine katılmış üyeler
   * **İlişkisel Cebir:** $\pi_{full\_name} (member \bowtie event\_registration \bowtie event \bowtie_{club\_id} (club_{name='Yazilim'} \cup club_{name='Dans'}))$
4. **Soru:** Hiçbir etkinliğe kaydolmamış üyeler
   * **İlişkisel Cebir:** $\pi_{member\_id}(member) - \pi_{member\_id}(event\_registration)$
5. **Soru:** Aynı yaşa sahip farklı üye çiftleri
   * **İlişkisel Cebir:** $\rho_{m1}(member) \bowtie_{m1.age = m2.age \land m1.member\_id < m2.member\_id} \rho_{m2}(member)$
6. **Soru:** Tüm etkinliklere katılmış üyeler (Division)
   * **İlişkisel Cebir:** $\pi_{member\_id, event\_id}(event\_registration) \div \pi_{event\_id}(event)$
