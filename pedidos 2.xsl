<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
    <title>Productos Vendidos</title>
    <style>
      /* Estilos para la tabla de productos vendidos en el primer trimestre de 2020 */
      #primer-trimestre-2020 {
        font-family: Arial, sans-serif;
        font-size: 14px;
        border-collapse: collapse;
        width: 100%;
        background-color: #f2f2f2;
      }
      #primer-trimestre-2020 th, #primer-trimestre-2020 td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
      }
      #primer-trimestre-2020 th {
        background-color: #4CAF50;
        color: white;
      }

      /* Estilos para la tabla de productos vendidos en el último trimestre de 2021 */
      #ultimo-trimestre-2021 {
        font-family: Arial, sans-serif;
        font-size: 14px;
        border-collapse: collapse;
        width: 100%;
        background-color: #f2f2f2;
      }
      #ultimo-trimestre-2021 th, #ultimo-trimestre-2021 td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
      }
      #ultimo-trimestre-2021 th {
        background-color: #008CBA;
        color: white;
      }
    </style>
  </head>
  <body>
    <h2>Productos Vendidos en el Primer Trimestre de 2020</h2>
    <table id="primer-trimestre-2020">
      <tr>
        <th>Nombre del Producto</th>
        <th>Referencia</th>
        <th>Precio</th>
        <th>Unidades</th>
      </tr>
      <xsl:for-each select="//pedido[substring(detalle_pedido/fecha_compra, 1, 4) = '2020'][number(substring(detalle_pedido/fecha_compra, 6, 2)) &lt;= 3]/detalle_pedido/productos/producto">
        <tr>
          <td><xsl:value-of select="nombre"/></td>
          <td><xsl:value-of select="referencia"/></td>
          <td><xsl:value-of select="precio"/></td>
          <td><xsl:value-of select="unidades"/></td>
        </tr>
      </xsl:for-each>
    </table>

    <h2>Productos Vendidos en el Último Trimestre de 2021</h2>
    <table id="ultimo-trimestre-2021">
      <tr>
        <th>Nombre del Producto</th>
        <th>Referencia</th>
        <th>Precio</th>
        <th>Unidades</th>
      </tr>
      <xsl:for-each select="//pedido[substring(detalle_pedido/fecha_compra, 1, 4) = '2021'][number(substring(detalle_pedido/fecha_compra, 6, 2)) &gt;= 10]/detalle_pedido/productos/producto">
        <tr>
          <td><xsl:value-of select="nombre"/></td>
          <td><xsl:value-of select="referencia"/></td>
          <td><xsl:value-of select="precio"/></td>
          <td><xsl:value-of select="unidades"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
