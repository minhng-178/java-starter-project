<%-- 
    Document   : SizeGuide
    Created on : Mar 2, 2023, 9:21:35 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Shoe Size Conversion Table</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/style.css" />
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
                font-family: Arial, sans-serif;
                font-size: 14px;
                margin: 20px 0;
            }

            table th {
                background-color: #444;
                color: #fff;
                font-weight: bold;
                padding: 10px;
                text-align: left;
            }

            table td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
                transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
            }

            table tr:nth-child(odd) {
                background-color: #f2f2f2;
            }

            table td:hover {
                background-color: #ddd;
                color: #333;
            }

        </style>
    </head>
    <body>
        <jsp:include page="./include/Menu.jsp"></jsp:include>
            <div class="container">
                <table>
                    <thead>
                        <tr>
                            <th>US Men</th>
                            <th>US Women</th>
                            <th>UK</th>
                            <th>EU</th>
                            <th>Japan (cm)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>4.5</td>
                            <td>6.0</td>
                            <td>4.0</td>
                            <td>36</td>
                            <td>23</td>
                        </tr
                        <tr>
                            <td>5</td>
                            <td>6.5</td>
                            <td>4.5</td>
                            <td>37</td>
                            <td>23.5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>7.5</td>
                            <td>5.5</td>
                            <td>38</td>
                            <td>24</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>8.5</td>
                            <td>6.5</td>
                            <td>40</td>
                            <td>25</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>9.5</td>
                            <td>7.5</td>
                            <td>41</td>
                            <td>26</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>10.5</td>
                            <td>8.5</td>
                            <td>42</td>
                            <td>27</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>11.5</td>
                            <td>9.5</td>
                            <td>44</td>
                            <td>28</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>12.5</td>
                            <td>10.5</td>
                            <td>45</td>
                            <td>29</td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td>13.5</td>
                            <td>11.5</td>
                            <td>47</td>
                            <td>30</td>
                        </tr>
                        <tr>
                            <td>13</td>
                            <td>14.5</td>
                            <td>12.5</td>
                            <td>48</td>
                            <td>31</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        <jsp:include page="./include/Footer.jsp"></jsp:include>      
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>

