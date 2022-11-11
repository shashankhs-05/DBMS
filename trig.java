import javax.swing.*;
import java.awt.*;
public class trig {

    public static void main(String[] args){
      JFrame frame = new JFrame();
      JButton button = new JButton();
      JButton button1 = new JButton();
      JButton button2 = new JButton();
      JButton button3 = new JButton();
      JButton button4 = new JButton();
      JButton button5 = new JButton();
      JButton button6 = new JButton();
      button.setFocusable(false);
      button1.setFocusable(false);
      button2.setFocusable(false);
      button3.setFocusable(false);
      button4.setFocusable(false);
      button5.setFocusable(false);
      button6.setFocusable(false);
      JTextField textField = new JTextField();
      textField.setBounds(0, 5, 300, 20);
      textField.setBackground(Color.BLACK);
      textField.setForeground(Color.LIGHT_GRAY);
      textField.setFont(new Font("Times new roman",Font.BOLD,20));
          button.setText("SIN");
          button.addActionListener(e -> {
              String i1 = textField.getText();
              double a = Double.parseDouble(i1);
              double q = Math.toRadians(a);
              textField.setText(String.valueOf(Math.sin(q)));
          });
          button.setBounds(0, 30, 100, 100);
          //Cos
          button1.setText("COS");
          button1.addActionListener(e -> {
              String i1 = textField.getText();
              double a = Double.parseDouble(i1);
              double q = Math.toRadians(a);
              textField.setText(String.valueOf(Math.cos(q)));
          });
          button1.setBounds(100, 30, 100, 100);
          //Tan
          button2.setText("TAN");
          button2.addActionListener(e -> {
              String i1 = textField.getText();
              double a = Double.parseDouble(i1);
              double q = Math.toRadians(a);
              textField.setText(String.valueOf(Math.tan(q)));
          });
          button2.setBounds(200, 30, 100, 100);
          //cosec
          button3.setText("COSEC");
          button3.addActionListener(e -> {
              String i1 = textField.getText();
              double a = Double.parseDouble(i1);
              double q = Math.toRadians(a);
              textField.setText(String.valueOf((1 / Math.sin(q))));
          });
          button3.setBounds(0, 130, 100, 100);
          //Sec
          button4.setText("SEC");
          button4.addActionListener(e -> {
              String i1 = textField.getText();
              double a = Double.parseDouble(i1);
              double q = Math.toRadians(a);
              textField.setText(String.valueOf((1 / Math.cos(q))));
          });
          button4.setBounds(100, 130, 100, 100);
          //Cot
          button5.setText("COT");
          button5.addActionListener(e -> {
              String i1 = textField.getText();
              double a = Double.parseDouble(i1);
              double q = Math.toRadians(a);
              textField.setText(String.valueOf((1 / Math.tan(q))));
          });
          button5.setBounds(200, 130, 100, 100);
          button6.setText("Clear");
          button6.addActionListener(e -> textField.setText(null));
          button6.setBounds(100, 230, 100, 100);
      frame.setLayout(null);
      frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
      frame.setResizable(false);
      frame.setForeground(Color.BLACK);
      frame.setSize(310, 360);
      frame.add(button);
      frame.add(button1);
      frame.add(button2);
      frame.add(button3);
      frame.add(button4);
      frame.add(button5);
      frame.add(button6);
      frame.add(textField);
      frame.setVisible(true);
  }
}
