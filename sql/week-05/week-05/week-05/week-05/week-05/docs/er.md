# ER Diyagramı

```mermaid
erDiagram
    CLUB ||--o{ EVENT : organizes
    MEMBER ||--o{ EVENT_REGISTRATION : registers
    EVENT ||--o{ EVENT_REGISTRATION : has

    CLUB {
        int club_id PK
        string club_name
        string category
    }

    MEMBER {
        int member_id PK
        string full_name
        string email
        int age
    }

    EVENT {
        int event_id PK
        int club_id FK
        string title
        int capacity
        int rating
        string status
        date start_date
        date end_date
    }

    EVENT_REGISTRATION {
        int registration_id PK
        int member_id FK
        int event_id FK
        date registration_date
    }
