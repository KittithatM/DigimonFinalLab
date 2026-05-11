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
          "id": "ec0529eb-a7cf-4771-b33b-66e820ab670b",
          "type": "basic.input",
          "data": {
            "name": "",
            "virtual": false,
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "P1_B1",
                "value": "43"
              },
              {
                "index": "2",
                "name": "P1_B2",
                "value": "38"
              },
              {
                "index": "1",
                "name": "P1_B3",
                "value": "34"
              },
              {
                "index": "0",
                "name": "P1_B4",
                "value": "31"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 216,
            "y": 192
          }
        },
        {
          "id": "e69f6f39-0383-4635-b321-5d7a9f02d345",
          "type": "basic.output",
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
            ]
          },
          "position": {
            "x": 1440,
            "y": 216
          }
        },
        {
          "id": "f461f092-fd9d-44eb-98ab-1b9bb99c7e71",
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
            "x": 472,
            "y": 464
          }
        },
        {
          "id": "c5a8fe16-acf8-4119-932b-bdaede5e65f8",
          "type": "73122e643f26d65e58cfd7e6726b20c066675565",
          "position": {
            "x": 376,
            "y": 240
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "eb3ede3a-e227-4673-8eaf-ad8d631de4af",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "ind",
                  "range": "[3:0]",
                  "size": 4
                },
                {
                  "name": "Clk_i"
                }
              ],
              "out": [
                {
                  "name": "led",
                  "range": "[7:0]",
                  "size": 8
                }
              ]
            },
            "params": [],
            "code": "\nreg [7:0] led;\nreg [31:0] co;\nreg [31:0] limit = 12000000;\n\nalways @(posedge Clk_i) begin\n    if (ind >= 4'b1000) begin\n        if (co >= limit - 1) begin\n            co <= 0;\n            led <= ~led;\n        end else begin\n            co <= co + 1;\n        end\n    end else begin\n        case (ind)\n            4'b0000: begin\n                led <= 8'b00000001;\n            end\n            4'b0001: begin\n                led <= 8'b00000011;\n            end\n            4'b0010: begin\n                led <= 8'b00000111;\n            end\n            4'b0011: begin\n                led <= 8'b00001111;\n            end\n            4'b0100: begin\n                led <= 8'b00011111;\n            end\n            4'b0101: begin\n                led <= 8'b00111111;\n            end\n            4'b0110: begin\n                led <= 8'b01111111;\n            end\n            4'b0111: begin\n                led <= 8'b11111111;\n            end\n            default: begin\n                led <= 8'b00000000;\n            end\n        endcase\n    end\nend"
          },
          "position": {
            "x": 632,
            "y": 80
          },
          "size": {
            "width": 696,
            "height": 552
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "ec0529eb-a7cf-4771-b33b-66e820ab670b",
            "port": "out"
          },
          "target": {
            "block": "c5a8fe16-acf8-4119-932b-bdaede5e65f8",
            "port": "cd4004e0-32a3-42b1-ba0d-c24fb7a48099"
          },
          "size": 4
        },
        {
          "source": {
            "block": "c5a8fe16-acf8-4119-932b-bdaede5e65f8",
            "port": "1d16f5eb-f6ba-46a9-b8ab-b6c37b089c1f"
          },
          "target": {
            "block": "eb3ede3a-e227-4673-8eaf-ad8d631de4af",
            "port": "ind"
          },
          "size": 4
        },
        {
          "source": {
            "block": "eb3ede3a-e227-4673-8eaf-ad8d631de4af",
            "port": "led"
          },
          "target": {
            "block": "e69f6f39-0383-4635-b321-5d7a9f02d345",
            "port": "in"
          },
          "size": 8
        },
        {
          "source": {
            "block": "f461f092-fd9d-44eb-98ab-1b9bb99c7e71",
            "port": "out"
          },
          "target": {
            "block": "eb3ede3a-e227-4673-8eaf-ad8d631de4af",
            "port": "Clk_i"
          }
        }
      ]
    }
  },
  "dependencies": {
    "73122e643f26d65e58cfd7e6726b20c066675565": {
      "package": {
        "name": "pull-up-x04",
        "version": "0.1",
        "description": "4 FPGA internal pull-ups",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20id=%22svg2%22%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%22-265%20401.5%2063.5%2038.4%22%3E%3Cstyle%3E.st0%7Bdisplay:none%7D.st1%7Bfill:none;stroke:#000;stroke-width:.75;stroke-linejoin:round;stroke-miterlimit:10%7D.st2%7Bfill:#010002%7D%3C/style%3E%3Cpath%20class=%22st0%22%20d=%22M-242.5%20411.8v11.8h-5.4v-11.8h5.4m1-1h-7.4v13.8h7.4v-13.8z%22/%3E%3Cpath%20d=%22M-212%20425.6l-15.4-8.7v8.5h-17.4v-2.7c0-.2-.1-.4-.3-.4l-2.3-1.2%205.6-2.9c.2-.1.3-.3.3-.5s-.1-.4-.3-.4l-5.7-2.7%202.4-1.6c.1-.1.2-.2.2-.4v-2.7h3.1l-3.5-6.1-3.5%206.1h3v2.5l-2.9%202c-.1.1-.2.3-.2.5s.1.3.3.4l5.6%202.6-5.6%202.9c-.2.1-.3.3-.3.4s.1.4.3.4l2.9%201.5v2.4H-265v1.2h37.6v8.5l15.4-8.7h10.5v-.8H-212zm-33.3-20.4l2.2%203.9h-4.5l2.3-3.9zm19.2%2027.7v-13.8l12.3%206.9-12.3%206.9z%22/%3E%3C/svg%3E",
        "otid": 1610484795425
      },
      "design": {
        "config": "true",
        "graph": {
          "blocks": [
            {
              "id": "1d16f5eb-f6ba-46a9-b8ab-b6c37b089c1f",
              "type": "basic.output",
              "data": {
                "name": "",
                "range": "[3:0]",
                "size": 4
              },
              "position": {
                "x": 1104,
                "y": 672
              }
            },
            {
              "id": "cd4004e0-32a3-42b1-ba0d-c24fb7a48099",
              "type": "basic.input",
              "data": {
                "name": "pin",
                "range": "[3:0]",
                "clock": false,
                "size": 4
              },
              "position": {
                "x": 80,
                "y": 672
              }
            },
            {
              "id": "5d9cf2dd-adfe-4374-859f-3fd1e40f3df7",
              "type": "basic.constant",
              "data": {
                "name": "on",
                "value": "1",
                "local": false
              },
              "position": {
                "x": 648,
                "y": 352
              }
            },
            {
              "id": "36f4a2e2-cb06-4e8a-8b7d-675e909ffc67",
              "type": "basic.info",
              "data": {
                "info": "The pull-ups are connected  \nby default",
                "readonly": true
              },
              "position": {
                "x": 776,
                "y": 360
              },
              "size": {
                "width": 208,
                "height": 56
              }
            },
            {
              "id": "3a7fbd89-fd2b-4118-ae9b-d8cb78ead775",
              "type": "d128d1f5731054d0e21100e0cf87352aa4823ec1",
              "position": {
                "x": 392,
                "y": 480
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "2dc1aacc-55d9-440f-91ef-642603d280ce",
              "type": "d128d1f5731054d0e21100e0cf87352aa4823ec1",
              "position": {
                "x": 496,
                "y": 568
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "06ff0879-a729-4001-8d39-9f30f949c165",
              "type": "d128d1f5731054d0e21100e0cf87352aa4823ec1",
              "position": {
                "x": 624,
                "y": 688
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "565d5cc2-c11e-4860-8c55-31fddabbf6b3",
              "type": "d128d1f5731054d0e21100e0cf87352aa4823ec1",
              "position": {
                "x": 744,
                "y": 784
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "f4b7464c-db51-4ec3-9987-c356f8352046",
              "type": "c4f23ad05c2010ec9bd213c8814c9238873037ae",
              "position": {
                "x": 240,
                "y": 640
              },
              "size": {
                "width": 96,
                "height": 128
              }
            },
            {
              "id": "19a728e5-936b-48c4-b30a-ff82d833b0ca",
              "type": "84f0a15761ee8b753f67079819a7614923939472",
              "position": {
                "x": 928,
                "y": 640
              },
              "size": {
                "width": 96,
                "height": 128
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "f4b7464c-db51-4ec3-9987-c356f8352046",
                "port": "0f7487e5-b070-4277-bba6-acf69934afca"
              },
              "target": {
                "block": "565d5cc2-c11e-4860-8c55-31fddabbf6b3",
                "port": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150"
              },
              "vertices": [
                {
                  "x": 400,
                  "y": 760
                }
              ]
            },
            {
              "source": {
                "block": "565d5cc2-c11e-4860-8c55-31fddabbf6b3",
                "port": "a139fa0d-9b45-4480-a251-f4a66b49aa23"
              },
              "target": {
                "block": "19a728e5-936b-48c4-b30a-ff82d833b0ca",
                "port": "e4111201-8441-4e7d-bcd2-bcf9d265d043"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "2dc1aacc-55d9-440f-91ef-642603d280ce",
                "port": "a139fa0d-9b45-4480-a251-f4a66b49aa23"
              },
              "target": {
                "block": "19a728e5-936b-48c4-b30a-ff82d833b0ca",
                "port": "346b4ae4-4bb6-4845-9c17-3b25e0dde718"
              },
              "vertices": [
                {
                  "x": 840,
                  "y": 624
                }
              ]
            },
            {
              "source": {
                "block": "f4b7464c-db51-4ec3-9987-c356f8352046",
                "port": "33072210-9ba0-4659-8339-95952b939e6e"
              },
              "target": {
                "block": "2dc1aacc-55d9-440f-91ef-642603d280ce",
                "port": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "06ff0879-a729-4001-8d39-9f30f949c165",
                "port": "a139fa0d-9b45-4480-a251-f4a66b49aa23"
              },
              "target": {
                "block": "19a728e5-936b-48c4-b30a-ff82d833b0ca",
                "port": "969e11ca-69e8-403b-a566-7bf2fbe3a5a8"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "f4b7464c-db51-4ec3-9987-c356f8352046",
                "port": "f5a71d7b-de20-4527-80c8-0eb20de0dc77"
              },
              "target": {
                "block": "06ff0879-a729-4001-8d39-9f30f949c165",
                "port": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "cd4004e0-32a3-42b1-ba0d-c24fb7a48099",
                "port": "out"
              },
              "target": {
                "block": "f4b7464c-db51-4ec3-9987-c356f8352046",
                "port": "0ebd46a4-769b-45e6-bcaf-e3796264aed3"
              },
              "size": 4
            },
            {
              "source": {
                "block": "19a728e5-936b-48c4-b30a-ff82d833b0ca",
                "port": "55180947-6349-4a04-a151-ad69ea2b155e"
              },
              "target": {
                "block": "1d16f5eb-f6ba-46a9-b8ab-b6c37b089c1f",
                "port": "in"
              },
              "size": 4
            },
            {
              "source": {
                "block": "f4b7464c-db51-4ec3-9987-c356f8352046",
                "port": "bbe1895b-be8b-4237-b0d1-ae592e3e6208"
              },
              "target": {
                "block": "3a7fbd89-fd2b-4118-ae9b-d8cb78ead775",
                "port": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150"
              }
            },
            {
              "source": {
                "block": "5d9cf2dd-adfe-4374-859f-3fd1e40f3df7",
                "port": "constant-out"
              },
              "target": {
                "block": "3a7fbd89-fd2b-4118-ae9b-d8cb78ead775",
                "port": "121930e0-54c3-4b31-aa37-b33c7764abfa"
              }
            },
            {
              "source": {
                "block": "5d9cf2dd-adfe-4374-859f-3fd1e40f3df7",
                "port": "constant-out"
              },
              "target": {
                "block": "06ff0879-a729-4001-8d39-9f30f949c165",
                "port": "121930e0-54c3-4b31-aa37-b33c7764abfa"
              }
            },
            {
              "source": {
                "block": "5d9cf2dd-adfe-4374-859f-3fd1e40f3df7",
                "port": "constant-out"
              },
              "target": {
                "block": "2dc1aacc-55d9-440f-91ef-642603d280ce",
                "port": "121930e0-54c3-4b31-aa37-b33c7764abfa"
              },
              "vertices": [
                {
                  "x": 592,
                  "y": 464
                }
              ]
            },
            {
              "source": {
                "block": "5d9cf2dd-adfe-4374-859f-3fd1e40f3df7",
                "port": "constant-out"
              },
              "target": {
                "block": "565d5cc2-c11e-4860-8c55-31fddabbf6b3",
                "port": "121930e0-54c3-4b31-aa37-b33c7764abfa"
              },
              "vertices": [
                {
                  "x": 728,
                  "y": 464
                }
              ]
            },
            {
              "source": {
                "block": "3a7fbd89-fd2b-4118-ae9b-d8cb78ead775",
                "port": "a139fa0d-9b45-4480-a251-f4a66b49aa23"
              },
              "target": {
                "block": "19a728e5-936b-48c4-b30a-ff82d833b0ca",
                "port": "6c2aa548-5a4c-4e8d-a56c-a70926b19f18"
              },
              "vertices": [
                {
                  "x": 880,
                  "y": 568
                }
              ]
            }
          ]
        }
      }
    },
    "d128d1f5731054d0e21100e0cf87352aa4823ec1": {
      "package": {
        "name": "Pull-upx1_ICE40",
        "version": "1.0.2",
        "description": "Pull-up_ICE40:: FPGA internal pull-up configuration on the input port. ICE40 FPGA family",
        "author": "Juan González",
        "image": "%3Csvg%20id=%22svg2%22%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%22-265%20401.5%2063.5%2038.4%22%3E%3Cstyle%3E.st0%7Bdisplay:none%7D.st1%7Bfill:none;stroke:#000;stroke-width:.75;stroke-linejoin:round;stroke-miterlimit:10%7D.st2%7Bfill:#010002%7D%3C/style%3E%3Cpath%20class=%22st0%22%20d=%22M-242.5%20411.8v11.8h-5.4v-11.8h5.4m1-1h-7.4v13.8h7.4v-13.8z%22/%3E%3Cpath%20d=%22M-212%20425.6l-15.4-8.7v8.5h-17.4v-2.7c0-.2-.1-.4-.3-.4l-2.3-1.2%205.6-2.9c.2-.1.3-.3.3-.5s-.1-.4-.3-.4l-5.7-2.7%202.4-1.6c.1-.1.2-.2.2-.4v-2.7h3.1l-3.5-6.1-3.5%206.1h3v2.5l-2.9%202c-.1.1-.2.3-.2.5s.1.3.3.4l5.6%202.6-5.6%202.9c-.2.1-.3.3-.3.4s.1.4.3.4l2.9%201.5V425.5H-265v1.2h37.6v8.5l15.4-8.7h10.5v-.8H-212zm-33.3-20.4l2.2%203.9h-4.5l2.3-3.9zm19.2%2027.7v-13.8l12.3%206.9-12.3%206.9z%22/%3E%3C/svg%3E"
      },
      "design": {
        "config": "true",
        "graph": {
          "blocks": [
            {
              "id": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150",
              "type": "basic.input",
              "data": {
                "name": "pin",
                "clock": false
              },
              "position": {
                "x": 72,
                "y": 256
              }
            },
            {
              "id": "a139fa0d-9b45-4480-a251-f4a66b49aa23",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 704,
                "y": 256
              }
            },
            {
              "id": "121930e0-54c3-4b31-aa37-b33c7764abfa",
              "type": "basic.constant",
              "data": {
                "name": "on",
                "value": "1",
                "local": false
              },
              "position": {
                "x": 408,
                "y": -8
              }
            },
            {
              "id": "2b245a71-2d80-466b-955f-e3d61839fe25",
              "type": "basic.code",
              "data": {
                "code": "// 1-Pull up\n\n//-- Place the IO block, configured as  \n//-- input with pull-up\nSB_IO\n  #(\n    .PIN_TYPE(6'b 1010_01),\n    \n    //-- The pull-up is activated or not\n    //-- depeding on the ON parameter\n    .PULLUP(ON)\n    \n  ) input_pin (\n\n    //--- Input pin\n    .PACKAGE_PIN(i),\n    \n    //-- Block output\n    .D_IN_0(o),\n    \n    //-- Configured as input\n    .OUTPUT_ENABLE(1'b0),\n    \n    //-- Not used\n    .D_OUT_0(1'b0)\n  );",
                "params": [
                  {
                    "name": "ON"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "i"
                    }
                  ],
                  "out": [
                    {
                      "name": "o"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 104
              },
              "size": {
                "width": 392,
                "height": 368
              }
            },
            {
              "id": "8055c1f2-dad2-4257-a271-c0bd64700cd7",
              "type": "basic.info",
              "data": {
                "info": "### Pull-up parameter:\n\n0: No pull-up  \n1: Pull-up activated",
                "readonly": true
              },
              "position": {
                "x": 144,
                "y": -48
              },
              "size": {
                "width": 264,
                "height": 104
              }
            },
            {
              "id": "5a96e53f-d2ff-4058-bbed-779876848487",
              "type": "basic.info",
              "data": {
                "info": "Only an FPGA pin can  \nbe connected here!!!",
                "readonly": true
              },
              "position": {
                "x": 56,
                "y": 200
              },
              "size": {
                "width": 192,
                "height": 56
              }
            },
            {
              "id": "26b0a2d0-aaa1-4204-9e57-2f2d674e03a0",
              "type": "basic.info",
              "data": {
                "info": "The pull-up is connected  \nby default",
                "readonly": true
              },
              "position": {
                "x": 512,
                "y": 0
              },
              "size": {
                "width": 208,
                "height": 56
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150",
                "port": "out"
              },
              "target": {
                "block": "2b245a71-2d80-466b-955f-e3d61839fe25",
                "port": "i"
              }
            },
            {
              "source": {
                "block": "2b245a71-2d80-466b-955f-e3d61839fe25",
                "port": "o"
              },
              "target": {
                "block": "a139fa0d-9b45-4480-a251-f4a66b49aa23",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "121930e0-54c3-4b31-aa37-b33c7764abfa",
                "port": "constant-out"
              },
              "target": {
                "block": "2b245a71-2d80-466b-955f-e3d61839fe25",
                "port": "ON"
              }
            }
          ]
        }
      }
    },
    "c4f23ad05c2010ec9bd213c8814c9238873037ae": {
      "package": {
        "name": "Bus4-Split-all",
        "version": "0.1",
        "description": "Bus4-Split-all: Split the 4-bits bus into its wires",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22354.768%22%20height=%22241.058%22%20viewBox=%220%200%20332.59497%20225.99201%22%3E%3Cpath%20d=%22M168.377%2077.643l61.147-60.938C240.21%206.25%20254.56.461%20269.484.5h62.611v26.186l-61.698.046c-8.012-.043-15.705%203.133-21.47%208.81L187.48%2096.857a57.292%2057.292%200%200%201-39.993%2016.139%2057.292%2057.292%200%200%201%2039.993%2016.14l61.448%2061.314c5.765%205.677%2013.458%208.853%2021.47%208.81l61.698.046v26.186h-62.612c-14.924.039-29.463-5.9-40.204-16.28l-60.902-60.863a29.857%2029.857%200%200%200-21.347-8.81L.5%20139.427V86.457h146.524a29.884%2029.884%200%200%200%2021.353-8.814z%22%20fill=%22green%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "bbe1895b-be8b-4237-b0d1-ae592e3e6208",
              "type": "basic.output",
              "data": {
                "name": "3"
              },
              "position": {
                "x": 576,
                "y": 80
              }
            },
            {
              "id": "33072210-9ba0-4659-8339-95952b939e6e",
              "type": "basic.output",
              "data": {
                "name": "2"
              },
              "position": {
                "x": 600,
                "y": 144
              }
            },
            {
              "id": "0ebd46a4-769b-45e6-bcaf-e3796264aed3",
              "type": "basic.input",
              "data": {
                "name": "",
                "range": "[3:0]",
                "clock": false,
                "size": 4
              },
              "position": {
                "x": 128,
                "y": 184
              }
            },
            {
              "id": "f5a71d7b-de20-4527-80c8-0eb20de0dc77",
              "type": "basic.output",
              "data": {
                "name": "1"
              },
              "position": {
                "x": 592,
                "y": 240
              }
            },
            {
              "id": "0f7487e5-b070-4277-bba6-acf69934afca",
              "type": "basic.output",
              "data": {
                "name": "0"
              },
              "position": {
                "x": 568,
                "y": 296
              }
            },
            {
              "id": "16e78204-213e-4833-9096-89d735307ec2",
              "type": "basic.code",
              "data": {
                "code": "assign o3 = i[3];\nassign o2 = i[2];\nassign o1 = i[1];\nassign o0 = i[0];",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i",
                      "range": "[3:0]",
                      "size": 4
                    }
                  ],
                  "out": [
                    {
                      "name": "o3"
                    },
                    {
                      "name": "o2"
                    },
                    {
                      "name": "o1"
                    },
                    {
                      "name": "o0"
                    }
                  ]
                }
              },
              "position": {
                "x": 296,
                "y": 176
              },
              "size": {
                "width": 208,
                "height": 80
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o1"
              },
              "target": {
                "block": "f5a71d7b-de20-4527-80c8-0eb20de0dc77",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o0"
              },
              "target": {
                "block": "0f7487e5-b070-4277-bba6-acf69934afca",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o2"
              },
              "target": {
                "block": "33072210-9ba0-4659-8339-95952b939e6e",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o3"
              },
              "target": {
                "block": "bbe1895b-be8b-4237-b0d1-ae592e3e6208",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "0ebd46a4-769b-45e6-bcaf-e3796264aed3",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i"
              },
              "size": 4
            }
          ]
        }
      }
    },
    "84f0a15761ee8b753f67079819a7614923939472": {
      "package": {
        "name": "Bus4-Join-all",
        "version": "0.1",
        "description": "Bus4-Join-all: Join all the wires into a 4-bits Bus",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22354.768%22%20height=%22241.058%22%20viewBox=%220%200%20332.59497%20225.99201%22%3E%3Cpath%20d=%22M164.218%2077.643L103.07%2016.705C92.386%206.25%2078.036.461%2063.11.5H.5v26.186l61.698.046c8.012-.043%2015.705%203.133%2021.47%208.81l61.448%2061.315a57.292%2057.292%200%200%200%2039.993%2016.139%2057.292%2057.292%200%200%200-39.993%2016.14L83.668%20190.45c-5.765%205.677-13.458%208.853-21.47%208.81L.5%20199.306v26.186h62.612c14.924.039%2029.463-5.9%2040.204-16.28l60.902-60.863a29.857%2029.857%200%200%201%2021.347-8.81l146.53-.113V86.457H185.571a29.884%2029.884%200%200%201-21.353-8.814z%22%20fill=%22green%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "6c2aa548-5a4c-4e8d-a56c-a70926b19f18",
              "type": "basic.input",
              "data": {
                "name": "3",
                "clock": false
              },
              "position": {
                "x": 80,
                "y": 64
              }
            },
            {
              "id": "346b4ae4-4bb6-4845-9c17-3b25e0dde718",
              "type": "basic.input",
              "data": {
                "name": "2",
                "clock": false
              },
              "position": {
                "x": 80,
                "y": 136
              }
            },
            {
              "id": "55180947-6349-4a04-a151-ad69ea2b155e",
              "type": "basic.output",
              "data": {
                "name": "",
                "range": "[3:0]",
                "size": 4
              },
              "position": {
                "x": 712,
                "y": 200
              }
            },
            {
              "id": "969e11ca-69e8-403b-a566-7bf2fbe3a5a8",
              "type": "basic.input",
              "data": {
                "name": "1",
                "clock": false
              },
              "position": {
                "x": 80,
                "y": 208
              }
            },
            {
              "id": "e4111201-8441-4e7d-bcd2-bcf9d265d043",
              "type": "basic.input",
              "data": {
                "name": "0",
                "clock": false
              },
              "position": {
                "x": 80,
                "y": 272
              }
            },
            {
              "id": "16e78204-213e-4833-9096-89d735307ec2",
              "type": "basic.code",
              "data": {
                "code": "assign o = {i3, i2, i1, i0};\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i3"
                    },
                    {
                      "name": "i2"
                    },
                    {
                      "name": "i1"
                    },
                    {
                      "name": "i0"
                    }
                  ],
                  "out": [
                    {
                      "name": "o",
                      "range": "[3:0]",
                      "size": 4
                    }
                  ]
                }
              },
              "position": {
                "x": 296,
                "y": 176
              },
              "size": {
                "width": 344,
                "height": 104
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "969e11ca-69e8-403b-a566-7bf2fbe3a5a8",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i1"
              }
            },
            {
              "source": {
                "block": "e4111201-8441-4e7d-bcd2-bcf9d265d043",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i0"
              }
            },
            {
              "source": {
                "block": "346b4ae4-4bb6-4845-9c17-3b25e0dde718",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i2"
              },
              "vertices": [
                {
                  "x": 200,
                  "y": 176
                }
              ]
            },
            {
              "source": {
                "block": "6c2aa548-5a4c-4e8d-a56c-a70926b19f18",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i3"
              },
              "vertices": [
                {
                  "x": 224,
                  "y": 128
                }
              ]
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o"
              },
              "target": {
                "block": "55180947-6349-4a04-a151-ad69ea2b155e",
                "port": "in"
              },
              "size": 4
            }
          ]
        }
      }
    }
  }
}