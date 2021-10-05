package q4;

public class Constants {
    public static final String DB_URL = "jdbc:mysql://localhost:3306/league";
    public static final String DB_USERNAME = "root";
    public static final String DB_PASSWORD = "";

    public static final String MAX_VALUE_FOR_COACH_QUERY = "SELECT coachs.`name`, coachs.`value` " +
            "FROM coachs WHERE coachs.`value` = ( SELECT MAX( coachs.`value` ) FROM coachs )";

    public static final String MAX_VALUE_FOR_PLAYER_QUERY = "SELECT players.`name`, players.`value` " +
            "FROM players WHERE players.`value` = ( SELECT MAX( players.`value` ) FROM players )";

    public static final String TEAMS_COUNT_IN_EACH_CITY_QUERY = "SELECT c.`name`, COUNT(c.`name`) as `count` " +
            "FROM citys c JOIN teams t ON c.id = t.city_id GROUP BY city_id";

    public static final String TEAM_POINTS_QUERY = "SELECT teams.`name`, SUM(matchs_teams.points) as `points` " +
            "FROM matchs_teams INNER JOIN teams ON matchs_teams.team_id = teams.id GROUP BY matchs_teams.team_id";

    public static final String CHAMPION_TEAM_QUERY = "SELECT teams.`name`, SUM(matchs_teams.points) AS points " +
            "FROM matchs_teams INNER JOIN teams ON matchs_teams.team_id = teams.id GROUP BY matchs_teams.team_id " +
            "ORDER BY points DESC LIMIT 1";

    public static final String DERBY_MATCH_ID_WITH_MORE_GOAL = "SELECT " +
            "SUM( matchs_teams.scored_goals ) AS goals, matchs_teams.match_id " +
            "FROM matchs_teams " +
            "INNER JOIN teams " +
            "ON matchs_teams.team_id = teams.id " +
            "WHERE matchs_teams.is_derby = 1 " +
            "GROUP BY matchs_teams.match_id " +
            "ORDER BY goals DESC " +
            "LIMIT 1";

    public static final String DERBY_MATCH_WITH_MORE_GOALS_TEAMS = "SELECT teams.`name` FROM teams " +
            "INNER JOIN matchs_teams " +
            "ON teams.id = matchs_teams.team_id " +
            "WHERE matchs_teams.match_id = ?";
}
