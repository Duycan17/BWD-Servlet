/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.io.IOException;

/**
 *
 * @author duy
 */
public class MiBand4Service {
    public static void startAutomation() {
        Thread m = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    MiBand4Automation ma = new MiBand4Automation();
                } catch (IOException | InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        m.start();
    }
}