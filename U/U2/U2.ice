{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "iCEBreaker",
    "graph": {
      "blocks": [
        {
          "id": "bc18f30e-aacc-4f78-8d2b-72318e9f0911",
          "type": "basic.input",
          "data": {
            "name": "",
            "virtual": false,
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "P1_A1",
                "value": "4"
              },
              {
                "index": "6",
                "name": "P1_A2",
                "value": "2"
              },
              {
                "index": "5",
                "name": "P1_A3",
                "value": "47"
              },
              {
                "index": "4",
                "name": "P1_A4",
                "value": "45"
              },
              {
                "index": "3",
                "name": "P1_A7",
                "value": "3"
              },
              {
                "index": "2",
                "name": "P1_A8",
                "value": "48"
              },
              {
                "index": "1",
                "name": "P1_A9",
                "value": "46"
              },
              {
                "index": "0",
                "name": "P1_A10",
                "value": "44"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 8,
            "y": 32
          }
        },
        {
          "id": "582463ad-7b8b-4695-9b81-a5bb96756e07",
          "type": "basic.output",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "LED_R",
                "value": "39"
              }
            ]
          },
          "position": {
            "x": 1048,
            "y": 296
          }
        },
        {
          "id": "d68e108a-a9cc-421e-80c5-8e4f4cc611fe",
          "type": "basic.input",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "35"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 128,
            "y": 416
          }
        },
        {
          "id": "72272537-5807-41c6-bae2-385e7126670a",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "ADC",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "Clk_i"
                }
              ],
              "out": [
                {
                  "name": "fq"
                }
              ]
            },
            "params": [],
            "code": "\nreg [31:0] Co;\nreg f = 0;\n// reg [15:0] traget = 100 + ADC;\nreg [31:0] limit = 12000000 / (2 * (100 + ADC));\n\nalways @(posedge Clk_i) begin\n    Co <= Co + 1;\n    if(Co >= limit - 1) begin\n        Co <= 0;\n        f <= ~f;\n    end\nend\nassign fq = f;"
          },
          "position": {
            "x": 304,
            "y": 96
          },
          "size": {
            "width": 704,
            "height": 464
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "72272537-5807-41c6-bae2-385e7126670a",
            "port": "fq"
          },
          "target": {
            "block": "582463ad-7b8b-4695-9b81-a5bb96756e07",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "d68e108a-a9cc-421e-80c5-8e4f4cc611fe",
            "port": "out"
          },
          "target": {
            "block": "72272537-5807-41c6-bae2-385e7126670a",
            "port": "Clk_i"
          }
        },
        {
          "source": {
            "block": "bc18f30e-aacc-4f78-8d2b-72318e9f0911",
            "port": "out"
          },
          "target": {
            "block": "72272537-5807-41c6-bae2-385e7126670a",
            "port": "ADC"
          },
          "size": 8
        }
      ]
    }
  },
  "dependencies": {}
}