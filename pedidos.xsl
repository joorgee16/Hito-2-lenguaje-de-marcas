<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
    <title>Información de Pedidos, Clientes y Factura</title>
    <style>
      table {
        border-collapse: collapse;
        width: 100%;
      }
      th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
      }
      th {
        background-color: #f2f2f2;
      }
    </style>
  </head>
  <body>
    <h2>Información de Pedidos</h2>
    <table>
      <tr>
        <th>Número de Pedido</th>
        <th>Fecha de Compra</th>
        <th>Fecha de Entrega</th>
        <th>Total de la Factura</th>
      </tr>
      <xsl:for-each select="//detalle_pedido">
        <tr>
          <td><xsl:value-of select="numero_pedido"/></td>
          <td><xsl:value-of select="fecha_compra"/></td>
          <td><xsl:value-of select="fecha_entrega"/></td>
          <td><xsl:value-of select="total_factura"/></td>
        </tr>
      </xsl:for-each>
    </table>
    
    <h2>Información de Clientes</h2>
    <table>
      <tr>
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>Teléfono</th>
        <th>Dirección</th>
        <th>Correo Electrónico</th>
        <th>Fecha de Inclusión</th>
      </tr>
      <xsl:for-each select="//cliente">
        <tr>
          <td><xsl:value-of select="nombre"/></td>
          <td><xsl:value-of select="apellidos"/></td>
          <td><xsl:value-of select="telefono"/></td>
          <td>
            <xsl:value-of select="direccion/calle"/>, 
            <xsl:value-of select="direccion/ciudad"/>, 
            <xsl:value-of select="direccion/codigo_postal"/>, 
            <xsl:value-of select="direccion/provincia"/>
          </td>
          <td><xsl:value-of select="correo"/></td>
          <td><xsl:value-of select="fecha_inclusion"/></td>
        </tr>
      </xsl:for-each>
    </table>
    
    <h2>Factura de un Cliente</h2>
    <table>
      <tr>
        <th>Producto</th>
        <th>Referencia</th>
        <th>Precio</th>
        <th>Unidades</th>
      </tr>
      <xsl:for-each select="//pedido[cliente/nombre='Juan']">
        <xsl:for-each select="detalle_pedido/productos/producto">
          <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="referencia"/></td>
            <td><xsl:value-of select="precio"/></td>
            <td><xsl:value-of select="unidades"/></td>
          </tr>
        </xsl:for-each>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
