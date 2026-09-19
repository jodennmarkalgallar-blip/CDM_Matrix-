`default_nettype none

// Glyph ROM for the name string below. Glyph index c is the position of the
// character inside the string (0..26); repeated letters share one bitmap.
//
//   "JODENN MARK ALGALLAR MSUIIT"
//    0123456789...  (27 characters, including 3 spaces)
module glyphs_rom(
    input  wire [5:0] c, input  wire [3:0] y, input  wire [2:0] x, output reg pixel
);
    reg [7:0] rb;

    always @(*) begin
        case (c)
            0: case(y) 2:rb=8'h3F; 3,4,5,6,7,8:rb=8'h0C; 9:rb=8'hCC; 10:rb=8'h78; default:rb=0; endcase // 'J'
            1: case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // 'O'
            2: case(y) 2,10:rb=8'hF8; 3,4,5,6,7,8,9:rb=8'hC6; default:rb=0; endcase // 'D'
            3: case(y) 2,6,10:rb=8'hFE; 3,4,5,7,8,9:rb=8'hC0; default:rb=0; endcase // 'E'
            4,5: case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // 'N'
            6,11,20: rb = 8'h00; // 'SPACE'
            7,21: case(y) 2:rb=8'hC3; 3:rb=8'hE7; 4:rb=8'hFF; 5:rb=8'hDB; 6,7,8,9,10:rb=8'hC3; default:rb=0; endcase // 'M'
            8,12,15,18: case(y) 2:rb=8'h3C; 3,4,5:rb=8'h66; 6,7:rb=8'hFF; 8,9,10:rb=8'hC3; default:rb=0; endcase // 'A'
            9,19: case(y) 2,6:rb=8'hFC; 3,4,5:rb=8'hC6; 7,8,9:rb=8'hD8; 10:rb=8'hC6; default:rb=0; endcase // 'R'
            10: case(y) 2,10:rb=8'hC6; 3,9:rb=8'hCC; 4,8:rb=8'hD8; 5,7:rb=8'hF0; 6:rb=8'hE0; default:rb=0; endcase // 'K'
            13,16,17: case(y) 2,3,4,5,6,7,8,9:rb=8'hC0; 10:rb=8'hFE; default:rb=0; endcase // 'L'
            14: case(y) 2,10:rb=8'h7E; 3,4,5:rb=8'hC0; 6:rb=8'hCE; 7,8,9:rb=8'hC6; default:rb=0; endcase // 'G'
            22: case(y) 2:rb=8'h3E; 3:rb=8'h63; 4:rb=8'h60; 5:rb=8'h7C; 6,7:rb=8'h06; 8:rb=8'h63; 9:rb=8'h3E; default:rb=0; endcase // 'S'
            23: case(y) 2,3,4,5,6,7,8,9:rb=8'hC6; 10:rb=8'h7E; default:rb=0; endcase // 'U'
            24,25: case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // 'I'
            26: case(y) 2:rb=8'hFF; 3,4,5,6,7,8,9,10:rb=8'h18; default:rb=0; endcase // 'T'
            default: rb = 8'h00;
        endcase
        pixel = rb[7-x];
    end
endmodule
