import 'package:flutter/material.dart';

const TOTAL_OVERS = 20;
const NAME = "Archit Jain";
const TEAM_NAME1 = "Team Name 1";
const TEAM_NAME2 = "Team Name 2";
const EMPTY_PLAYER = {
  "id": -1,
  "skill_name": " ",
  "nationality": " ",
  "additional_skill": " ",
  "sport_specific_keys": {
    "additional_skill": " ",
    "is_captain": 0,
    "batting": {
      "style": " "
    },
    "bowling": {
      "style": " "
    }
  }
};
const TEAM1_SELECTED_PLAYERS = [
  {
    "id": 389,
    "skill_name": "BATSMAN",
    "nationality": "Overseas",
    "additional_skill": "ALLROUNDER",
    "sport_specific_keys": {
      "additional_skill": "ALLROUNDER",
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM FAST"
      }
    },
    "name": "Kieron Pollard",
    "chosen": false,
    "selected": false
  },
  {
    "id": 725,
    "skill_name": "BOWLER",
    "nationality": "Overseas",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "LEFT ARM FAST"
      }
    },
    "name": "Tymal Mills"
  },
  {
    "id": 125,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": "ALLROUNDER",
    "sport_specific_keys": {
      "additional_skill": "ALLROUNDER",
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM LEG SPIN"
      }
    },
    "name": "Murugan Ashwin"
  },
  {
    "id": 34,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM OFF SPIN"
      }
    },
    "name": "Anmolpreet Singh"
  },
  {
    "id": 187,
    "skill_name": "BOWLER",
    "nationality": "Overseas",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM LEG SPIN"
      }
    },
    "name": "Dewald Brevis"
  },
  {
    "id": 67,
    "skill_name": "BOWLER",
    "nationality": "Overseas",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "LEFT ARM FAST"
      }
    },
    "name": "Daniel Sams"
  },
  {
    "id": 583,
    "skill_name": "BOWLER",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM FAST"
      }
    },
    "name": "Jasprit Bumrah"
  },
  {
    "id": 550,
    "skill_name": "BOWLER",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM LEG SPIN"
      }
    },
    "name": "Mayank Markande"
  },
  {
    "id": 525,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM FAST"
      }
    },
    "name": "Ramandeep Singh"
  },
  {
    "id": 423,
    "skill_name": "BOWLER",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM OFF SPIN"
      }
    },
    "name": "Hrithik Shokeen"
  },
  {
    "id": 420,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": "ALLROUNDER",
    "sport_specific_keys": {
      "additional_skill": "ALLROUNDER",
      "is_captain": 0,
      "batting": {
        "style": "LEFT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM OFF SPIN"
      }
    },
    "name": "Thakur Tilak Varma"
  }
];

const TEAM2_SELECTED_PLAYERS = [
  {
    "id": 39,
    "skill_name": "BATSMAN",
    "nationality": "Overseas",
    "additional_skill": "ALLROUNDER",
    "sport_specific_keys": {
      "additional_skill": "ALLROUNDER",
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM FAST"
      }
    },
    "name": "Pollard",
    "chosen": false,
    "selected": false
  },
  {
    "id": 725,
    "skill_name": "BOWLER",
    "nationality": "Overseas",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "LEFT ARM FAST"
      }
    },
    "name": "Tymal Mills"
  },
  {
    "id": 125,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": "ALLROUNDER",
    "sport_specific_keys": {
      "additional_skill": "ALLROUNDER",
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM LEG SPIN"
      }
    },
    "name": "Murugan Ashwin"
  },
  {
    "id": 34,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM OFF SPIN"
      }
    },
    "name": "Anmolpreet Singh"
  },
  {
    "id": 187,
    "skill_name": "BOWLER",
    "nationality": "Overseas",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM LEG SPIN"
      }
    },
    "name": "Dewald Brevis"
  },
  {
    "id": 67,
    "skill_name": "BOWLER",
    "nationality": "Overseas",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "LEFT ARM FAST"
      }
    },
    "name": "Daniel Sams"
  },
  {
    "id": 583,
    "skill_name": "BOWLER",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM FAST"
      }
    },
    "name": "Jasprit Bumrah"
  },
  {
    "id": 550,
    "skill_name": "BOWLER",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM LEG SPIN"
      }
    },
    "name": "Mayank Markande"
  },
  {
    "id": 525,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM FAST"
      }
    },
    "name": "Ramandeep Singh"
  },
  {
    "id": 423,
    "skill_name": "BOWLER",
    "nationality": "India",
    "additional_skill": null,
    "sport_specific_keys": {
      "additional_skill": null,
      "is_captain": 0,
      "batting": {
        "style": "RIGHT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM OFF SPIN"
      }
    },
    "name": "Hrithik Shokeen"
  },
  {
    "id": 420,
    "skill_name": "BATSMAN",
    "nationality": "India",
    "additional_skill": "ALLROUNDER",
    "sport_specific_keys": {
      "additional_skill": "ALLROUNDER",
      "is_captain": 0,
      "batting": {
        "style": "LEFT HAND BATSMAN"
      },
      "bowling": {
        "style": "RIGHT ARM OFF SPIN"
      }
    },
    "name": "Thakur Tilak Varma"
  }
];
