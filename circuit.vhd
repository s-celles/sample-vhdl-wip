library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Main entity
entity circuit_test is
end circuit_test;

-- Circuit architecture
architecture Behavioral of circuit_test is
    -- Signal declaration
    signal x : std_logic_vector(0 to 4);      -- Entrée
    signal w : std_logic_vector(0 to 4);      -- Signal intermédiaire (AND)
    signal y : std_logic_vector(0 to 4);      -- Sortie
    signal y_exp : std_logic_vector(0 to 4);  -- Sortie attendue


begin
    -- AND gates
    w(0) <= x(4) and (not x(0));
    w(1) <= x(0) and (not x(1));
    w(2) <= x(1) and (not x(2));
    w(3) <= x(2) and (not x(3));
    w(4) <= x(3) and (not x(4));

    -- XOR gates
    y(0) <= w(4) xor x(0);
    y(1) <= w(0) xor x(1);
    y(2) <= w(1) xor x(2);
    y(3) <= w(2) xor x(3);
    y(4) <= w(3) xor x(4);

    -- Test process
    test_proc: process
    begin
        -- Test 1 with known input
        x <= "10000";
        y_exp <= "10100";
        wait for 10 ns;

        -- Display results
        report "Test 1 results:";
        report "Input (x0,x1,x2,x3,x4) = " & to_string(x);
        report "Output (y0,y1,y2,y3,y4) = " & to_string(y);

        -- Verify results
        if (y /= y_exp) then
            report "Test 1 failed: y incorrect" severity ERROR;
            report "Got: " & to_string(y);
            report "Expected: " & to_string(y_exp);
        else
            report "Test 1 passed: y = " & to_string(y);
        end if;

        -- Test 2
        x <= "10011";
        wait for 10 ns;

        report "Test 2 results:";
        report "Input (x0,x1,x2,x3,x4) = " & to_string(x);
        report "Output (y0,y1,y2,y3,y4) = " & to_string(y);
        report "Test complete";

        wait;
    end process;

    -- Monitor process
    monitor_proc: process
    begin
        report "Time=" & time'image(now) & " ns" &
               " IN x=" & to_string(x) &
               " w=" & to_string(w) &
               " OUT y=" & to_string(y);
        wait on x, w, y;
    end process;

end Behavioral;