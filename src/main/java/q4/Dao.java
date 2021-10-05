package q4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dao {

    public void maxValueForCoach() {
        try (
                Connection connection = DbConnection.createConnection();
                PreparedStatement ps = connection.prepareStatement(Constants.MAX_VALUE_FOR_COACH_QUERY);
        ) {
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                long value = resultSet.getLong("value");
                System.out.println("Name: " + name + ", Value: " + value);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void maxValueForPlayer() {
        try (
                Connection connection = DbConnection.createConnection();
                PreparedStatement ps = connection.prepareStatement(Constants.MAX_VALUE_FOR_PLAYER_QUERY);
        ) {
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                long value = resultSet.getLong("value");
                System.out.println("Name: " + name + ", Value: " + value);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void teamsCountInEachCity() {
        try (
                Connection connection = DbConnection.createConnection();
                PreparedStatement ps = connection.prepareStatement(Constants.TEAMS_COUNT_IN_EACH_CITY_QUERY);
        ) {
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int count = resultSet.getInt("count");
                System.out.println("City Name: " + name + " => Teams Count: " + count);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void teamsPoints() {
        try (
                Connection connection = DbConnection.createConnection();
                PreparedStatement ps = connection.prepareStatement(Constants.TEAM_POINTS_QUERY);
        ) {
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int point = resultSet.getInt("points");
                System.out.println("Team Name: " + name + " => Point: " + point);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void championTeam() {
        try (
                Connection connection = DbConnection.createConnection();
                PreparedStatement ps = connection.prepareStatement(Constants.CHAMPION_TEAM_QUERY);
        ) {
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int point = resultSet.getInt("points");
                System.out.println("Champion Team Name: " + name + " => Point: " + point);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int derbyMatchIdWithMoreGoals() {
        int matchId = 0;
        try (
                Connection connection = DbConnection.createConnection();
                PreparedStatement ps = connection.prepareStatement(Constants.DERBY_MATCH_ID_WITH_MORE_GOAL);
        ) {
            int goals = 0;
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                matchId = resultSet.getInt("match_id");
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matchId;
    }

    public void derbyMatchTeamsWithMoreGoals() {

        int matchId = derbyMatchIdWithMoreGoals();

        try (
                Connection connection = DbConnection.createConnection();
                PreparedStatement teamsNamePs = connection.prepareStatement(Constants.DERBY_MATCH_WITH_MORE_GOALS_TEAMS);
        ) {
            teamsNamePs.setInt(1, matchId);
            ResultSet resultSet = teamsNamePs.executeQuery();

            System.out.println("Match id: " + matchId + ", and teams are: ");
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                System.out.println(name);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
