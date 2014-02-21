# Statement

11 February 20&#x2588;&#x2588;

&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588; &#x2588;. &#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;, M.D., P.C.<br />
&#x2588;&#x2588;&#x2588;&#x2588; &#x2588;&#x2588;&#x2588;&#x2588;&#x2588; &#x2588;&#x2588;&#x2588;.<br />
Boulder, CO 80&#x2588;&#x2588;&#x2588;

-----

Responsible party:

Matthew Scott<br />
&#x2588;&#x2588;&#x2588; &#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588; &#x2588;&#x2588;.<br />
Fort Collins, CO 80&#x2588;&#x2588;&#x2588;

Services provided to:<br />
Matthew Scott

Diagnosis code(s):<br />
300.01, 296.63

# $0.00

Total Balance Due

<table>
<thead>
<tr>
<th>Date</th>
<th>CPT</th>
<th>Description</th>
<th>Charge</th>
<th>Credit</th>
<th>Balance</th>
</tr>
</th>
<tbody>
<tr>
<td>11 Feb</td>
<td>99214</td>
<td>Established Pt Mod MDM</td>
<td>$115.00</td>
<td></td>
<td>$115.00</td>
</tr>
<tr style="background-color: #eee">
<td>11 Feb</td>
<td>90833</td>
<td>Psychotx Mod MDM 30</td>
<td>$20.00</td>
<td></td>
<td>$135.00</td>
</tr>
<tr>
<td>11 Feb</td>
<td></td>
<td>Payment</td>
<td></td>
<td>$135.00</td>
<td>$0.00</td>
</tr>
</tbody>
<tfoot style="font-weight: bold">
<tr>
<td></td>
<td></td>
<td>New Balance:</td>
<td></td>
<td></td>
<td>$0.00</td>
</tr>
</tfoot>
</table>

If you have any questions, call Office Manager: &#x2588;&#x2588;&#x2588;-&#x2588;&#x2588;&#x2588;-&#x2588;&#x2588;&#x2588;&#x2588;

Balance is payable upon receipt.<br />
Please make checks payable to:

&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588; &#x2588;. &#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;&#x2588;, M.D.

    class window.Cost extends Backbone.Model

    class window.CostView extends Backbone.View
      initialize: () ->
        @model.bind 'change', @render, this
        return

      render: () =>
        @$el.text d3.format('$,.2f')(@model.get('amount'))
        @$el.data 'intro', @model.get('explanation')
        return
