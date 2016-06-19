import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Stack;

/**
 * Example implementation of an RPN calculator
 * Make sure you are using Java 8+
 */
public class RPN {

    //If you don't understand this notation, search for Java Generics
    private final Stack<Double> stack = new Stack<>();

    public void processToken(String c) {
        // For each token, decide what to do
        // Remember that the stack is ordered from
        // last to first, so for operations like
        // subtraction and division, the order
        // matters
        switch (c) {
            case " ":
            case "":
                break;
            case "+":
                if (stack.size()<2) return;
                stack.push(stack.pop() + stack.pop());
                break;
            case "-":
                if (stack.size()<2) return;
                stack.push(-stack.pop() + stack.pop());
                break;
            case "*":
                if (stack.size()<2) return;
                stack.push(stack.pop() * stack.pop());
                break;
            case "/":
                if (stack.size()<2) return;
                stack.push(1.0/stack.pop() * stack.pop());
                break;
            case "~":
                if (stack.size()<1) return;
                stack.pop();
                break;
            default:
                stack.push(Double.parseDouble(c));
        }
    }

    public String toString() {
        return stack.toString();
    }

    public static List<String> getTokens(String line) {
        // We break up the line into separate tokens
        // We can't just split it based on a space,
        // because then input like 3 2+5/ would not
        // work.
        ArrayList<String> tokens = new ArrayList<>();

        // If the character is an operator, add it.
        // Otherwise, add this character to the last
        // token (ex: 10 5+ would be [10, 5, +]).
        for (char c : line.toCharArray()) {
            if (c == '+' || c == '-'
                    || c == '*' || c == '/'
                    || c=='~') {
                tokens.add("" + c);
                tokens.add("");
            }
            else if (c == ' ') {
                tokens.add("");
            }
            else {
                if (tokens.isEmpty()) tokens.add("");
                tokens.set(tokens.size()-1, tokens.get(tokens.size()-1) + c);
            }
        }

        return tokens;
    }

    public static void main(String... args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Enter an expression, or a blank line to exit.");

        RPN rpn = new RPN();

        while (true) {
            String line = in.nextLine();
            if (line.isEmpty()) break;

            for (String token : getTokens(line))
                rpn.processToken(token);

            System.out.println(rpn.toString());
        }

        in.close();
    }

}
