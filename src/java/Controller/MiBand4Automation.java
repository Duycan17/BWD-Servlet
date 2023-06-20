package Controller;

import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MiBand4Automation {
    static String output;

    public MiBand4Automation() throws IOException, InterruptedException {
        String command = "python3";
        String script = "/home/duy/Desktop/miband/miband4/miband4_console.py";
        String option = "-ss"; // Select "Get Steps/Meters/Calories/Fat Burned" option
        String mac = "FE:65:31:CD:2E:3E"; // Replace with your MiBand4's MAC address
        String authkey = "A4571900E0ABB57D0EB90850F1F9F995"; // Replace with your Mi Band 4's authentication key

        // Set the command-line arguments
        String[] cmd = {command, script, "-m", mac, "-k", authkey, option};

        // Execute the command and capture its output
        ProcessBuilder pb = new ProcessBuilder(cmd);
        pb.redirectErrorStream(true);
        Process p = pb.start();
        BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line;
        StringBuilder sb = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            System.out.println(line);
            sb.append(line).append("\n");
        }
        p.waitFor();
        output = sb.toString();

        // Store the output to a file
        try (FileWriter writer = new FileWriter("fitness_data.txt")) {
            writer.write(output);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Tuple<Integer, Integer, Integer, Integer> getDataFromMiBand4() {
        int steps = 0;
        int fatBurned = 0;
        int calories = 0;
        int distance = 0;
        try {
            // Read the data from the file
            String output = readFile("fitness_data.txt");

            // Assuming 'output' contains the output string
            Pattern pattern = Pattern.compile("Number\\s+of\\s+steps:\\s*(\\d+).*Fat\\s+Burned:\\s*(\\d+).*Calories:\\s*(\\d+).*Distance\\stravelled\\sin\\smeters:\\s*(\\d+)", Pattern.DOTALL);
            Matcher matcher = pattern.matcher(output);
            if (matcher.find()) {
                steps = Integer.parseInt(matcher.group(1));
                fatBurned = Integer.parseInt(matcher.group(2));
                calories = Integer.parseInt(matcher.group(3));
                distance = Integer.parseInt(matcher.group(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Tuple<Integer, Integer, Integer, Integer>(steps, fatBurned, calories, distance);
    }

    private static String readFile(String filename) throws IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}